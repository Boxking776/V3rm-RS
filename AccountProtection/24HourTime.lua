function localTime(date)
    local dateString = "{hour}:{min}"
    local result = string.gsub(dateString, "{(%w+)}", date)
    return result
end
print("Success | Script by Boxking776")    
game:GetService("Players").PlayerAdded:Connect(function(plr)
local now = os.time()
game.Players.LocalPlayer:Kick("Illegal Player Joined.\n \nKickTime: "..localTime(os.date("*t", now)).."\n \nPlayer: "..plr.Name.."\n")
end)
