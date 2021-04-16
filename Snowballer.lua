local gap = 4;
local angle = 10;

local j = 0;

local bestBonus = nil;

for _,v in pairs(workspace.Obstacles:GetChildren()) do
    if v:FindFirstChild("ObjectType") then
    if v.ObjectType.Value == "Bonus" then
        if bestBonus == nil or (bestBonus ~= nil and v.Bonus.Value >= bestBonus.Bonus.Value) then
            bestBonus = v
        end
    end
    if v.ObjectType.Value ~= "Bonus" then
       v:Destroy()
    end
    else 
        v:Destroy()
    end
end

for i=1,10000/gap,1 do
    j = j + 1
    clone = bestBonus:Clone()
    clone.Parent = bestBonus.Parent
    clone:FindFirstChildWhichIsA("BasePart").CFrame = CFrame.new(-4, -29, 207) + Vector3.new(0, math.sin(math.rad(angle))*-j*gap, math.cos(math.rad(angle))*j*gap)
end
