local date = os.date("*t")

print("Success!")

function getTime()
    local hour = tonumber(date["hour"])
    local minute = date["min"]
    if hour > 12 then
         hour = hour - 12
    end
    return(tostring(hour) .. ":" .. minute)
end
    
game:GetService("Players").PlayerAdded:Connect(function(plr)
game.Players.LocalPlayer:Kick("Illegal Player Joined.\n \nKickTime: "..getTime().."\n \nPlayer: "..plr.Name.."\n")
end)
