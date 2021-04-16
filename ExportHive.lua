repeat wait() until game:GetService("Players").LocalPlayer.Honeycomb.Value ~= nil
wait(0.5)

local bees = {}

local function equals(o1, o2)
    if o1 == o2 then return true end
    local o1Type = type(o1)
    local o2Type = type(o2)
    if o1Type ~= o2Type then return false end
    if o1Type ~= 'table' then return false end
    
    for _, v in pairs(o1) do
        if o2[_] ~= o1[_] then return false end
    end
    for _, v in pairs(o2) do
        if o1[_] ~= o2[_] then return false end
    end
    return true
end

local function addBee(bee)
    local flag = true
    for index, v in ipairs(bees) do
        if v:equals(bee) then
            v:add()
            bees[index] = v
            flag = false
        end
    end
    if flag then
        table.insert(bees, bee)
    end
end

local function export(delim)
    local d = delim or ","
    local exportfunc = writefile or print
    local exportstr = "\n" .. "Type" .. d .. "Level" .. d .. "Count" .. d .. "Gifted" .. d .. "Colour" .. d .. "Rarity" .. "\n"
    for _, be in pairs(bees) do
        local v = be.Stats
        exportstr = exportstr .. tostring(v.Bee) .. d .. tostring(v.Level) .. d .. tostring(be.Count) .. d .. tostring(v.Gifted) .. d .. tostring(v.Colour) .. d .. tostring(v.Rarity) .. "\n"
    end
    exportfunc("BSS Hive.csv", exportstr)
end

local function getRarity(Cell)
    return require(game:GetService("ReplicatedStorage").BeeTypes).GetTypes()[Cell.CellType.Value:sub(1,-4)].Rarity
end

local function getColour(Cell)
    local Color = require(game:GetService("ReplicatedStorage").BeeTypes).GetTypes()[Cell.CellType.Value:sub(1,-4)].ColorType
    if Color == "None" then Color = "Colorless" end
    return Color
end


local function Bee(Cell)
    local self = {["Stats"] = {},["Count"] = 1}
    local b = {["Bee"] = nil, ["Rarity"] = nil, ["Level"] = 1, ["Gifted"] = false, ["Colour"] = nil}
    b.Bee = Cell.CellType.Value:sub(1,-4) .. " Bee"
    b.Rarity = getRarity(Cell)
    b.Colour = getColour(Cell)
    b.Level = (Cell:FindFirstChild("LevelPart") and tonumber(Cell.LevelPart.SurfaceGui.TextLabel.Text)) or 1
    b.Gifted = (Cell:FindFirstChild("GiftedCell") ~= nil) or false
    self.Stats = b
    function self:add()
        self.Count = self.Count + 1
    end
    function self:equals(bee)
        return equals(self.Stats, bee.Stats)
    end
    function self:statsEqual(stats)
        return equals(self.Stats, stats)
    end
    wait()
    addBee(self)
end

for _, c in pairs(game:GetService("Players").LocalPlayer.Honeycomb.Value.Cells:GetChildren()) do
    if c:FindFirstChild("Faceplate") ~= nil then
        Bee(c)
        wait()
    end
end

export()
