local function Notify(text)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Egg Farmer";
            Text = text;
            Icon = "rbxassetid://1299491401";
            Duration = waittime;
      })	
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
   
function TP(part)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part
end

for i,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if string.find(v.Name,"RocketEgg") then
v:Destroy()
end
end       

while true do 
for i,e in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if string.find(e.Name,"GnomeEgg" or "RocketEgg" or "SubmarineEgg") and e:IsA("MeshPart") and e.Part.Transparency == 0.5 then
    e:Destroy()
    else
    for i,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if string.find(v.Name,"GnomeEgg") then
    noclip = true
    TP(v.CollisionPart.CFrame)
    wait(0.8)
    TP(v.CollisionPart.CFrame)
    Notify("Egg Collected: "..v.Name)
    wait(waittime)
    noclip=false
        end 
   end
    for i,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if string.find(v.Name,"RocketEgg") then
    noclip = true
    TP(v.CollisionPart.CFrame)
    wait(0.8)
    TP(v.CollisionPart.CFrame)
    Notify("Egg Collected: "..v.Name)
    wait(waittime)
    noclip=false
        end 
   end
    for i,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    if string.find(v.Name,"SubmarineEgg") then
    noclip = true
    TP(v.CollisionPart.CFrame)
    wait(0.8)
    TP(v.CollisionPart.CFrame)
    Notify("Egg Collected: "..v.Name)
    wait(waittime)
    noclip=false
        end 
   end
end
end
end
