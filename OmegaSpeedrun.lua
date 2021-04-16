 local flag = false
 
 local function Note(title,text,icon,duration)
game.StarterGui:SetCore("SendNotification", {
Title = title;
Text = text;
Icon = "rbxassetid://"..icon;
Duration = duration;
})
end
    
local function GoTo(time,pos)
    workspace.Gravity = 0
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = pos}):Play() wait(time)
    workspace.Gravity = 196.19999694824
end

noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)
if key == "o" then
noclip = not noclip
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)

for _,v in pairs(game.Workspace:GetChildren()) do

if string.find(v.Name,game.Players.LocalPlayer.Team.Name) then
    
realtycoon = v

while true do
wait(.1)
for _,e in pairs(realtycoon:GetChildren()) do
    
if e:IsA("BasePart") and e.Name == "BuyButton" and e.Transparency == 0 then
game:GetService("Workspace").Events.GiveCash:FireServer(e.Button.Cost.Value)
noclip = true
GoTo(0.75, e.CFrame)
Note("Activated Button",e.Button.ID.Value,1299491401,1.75)
print("Logs | Activated Button: "..e.Button.ID.Value.." | Price: "..e.Button.Cost.Value)
wait(ButtonWait)
noclip = false
else
if not flag then
Note("Auto-Farmer","Tycoon Completed",1299491401,10)
flag = true
end
end
end
end
end
end
