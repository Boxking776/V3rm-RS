return function Note(title,text,icon,duration)
game.StarterGui:SetCore("SendNotification", {
Title = title;
Text = text;
Icon = "rbxassetid://"..icon;
Duration = duration;
})
end
