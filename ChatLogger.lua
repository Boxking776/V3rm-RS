local function chatLogger(from, chat)
    if chat:match("^/w") ~= nil then
        to = chat:split(" ")[2]
        chat = chat:sub(("^/w "..chat:split(" ")[2]):len()+1)
    end
    if to == nil then
        print(from.Name .. ": " .. chat)
    else
        print(from.Name .. " --> " .. to .. ": " .. chat)
    end
end

for _, v in pairs(game.Players:GetPlayers()) do
    v.Chatted:Connect(function(c)
        chatLogger(v, c)
    end)
end

game.Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(c)
        chatLogger(plr, c)
    end)
end)
