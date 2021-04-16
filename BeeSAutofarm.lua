local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local function getPlr(name)
    return workspace.Players[name]
end

plr = getPlr(game.Players.LocalPlayer.Name)

for _, v in pairs(plr:GetChildren()) do
    if v:IsA("BasePart") then v.CanCollide = false end
end

local WorldTree = workspace.Worlds.Swamp["World Tree"]

local sellBlock

local upgradeBlock

local d = false

for _, v in pairs(WorldTree:GetChildren()) do
    if v.Name == "Part" then
        if d == false then d = true; upgradeBlock = v
        else sellBlock = v end
    end
end

upgradeBlock.CFrame = sellBlock.CFrame

plr:MoveTo(sellBlock.CFrame.Position)
wait(1)
local flower = workspace.Worlds.Swamp.Flowers.Hyacinth

local function getFlower()
    if flower.Parent == nil then
        flower = workspace.Worlds.Swamp.Flowers.Hyacinth
    end
    return flower
end

local TweenTime = 2

local useTween = false

plr:MoveTo(flower.INTERACT.CFrame.Position)
wait(0.5)
game.ReplicatedStorage.Events.Game.Flower:FireServer(flower.INTERACT)
wait(0.5)
plr:MoveTo(sellBlock.CFrame.Position)

local function Tween(pos, time)
    plr.Root.CFrame = CFrame.lookAt(plr.Root.CFrame.Position, pos)
    local c = plr.Root.CFrame - plr.Root.CFrame.Position + pos
    game:GetService("TweenService"):Create(getPlr(game.Players.LocalPlayer.Name).Root, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = c}):Play() wait(time)
end

local function newCollect()
    flower = getFlower()
    wait()
    if useTween then 
        Tween(flower.INTERACT.CFrame.Position+Vector3.new(0,flower.INTERACT.Size.Y,0), TweenTime)
    else
        plr:MoveTo(flower.INTERACT)
    end
    wait(0.5)
    game.ReplicatedStorage.Events.Game.Flower:FireServer(flower.INTERACT)
    wait(0.5)
    if useTween then 
        Tween(sellBlock.CFrame.Position+Vector3.new(0,flower.INTERACT.Size.Y,0), TweenTime)
    else
        plr:MoveTo(sellBlock.CFrame.Position)
    end
end

local flowerValid = true

game:GetService("RunService").Stepped:Connect(function()
    if flower.Parent == nil and flowerValid then
        flowerValid = false
        newCollect()
        flowerValid = true
    end
    if flowerValid then
        game:GetService("ReplicatedStorage").Events.Game.Sell:FireServer(sellBlock)
    end
end)

while true do
wait(1)
local v1 = "Achievements"
local v2 = "Pollen"
local rem = game:GetService("ReplicatedStorage").Events.Game.Quest
rem:FireServer(v1, v2)
end
