getgenv().Pluto = {
    Silent = {
        Enabled = false,
        Keybind = "k",
        Part = "UpperTorso",
        Pred = 0.136,
        ClosestPart = false,
    },
    FOV = {
        Visible = true,
        Radius = 30
    },
    AutoPred = {
        Enabled = true,
        P10 = 0.1001,
        P20 = 0.1105,
        P30 = 0.1181,
        P40 = 0.1234,
        P50 = 0.1288,
        P60 = 0.1332,
        P70 = 0.1356,
        P80 = 0.1381,
        P90 = 0.1405,
        P100 = 0.143,
        P110 = 0.1454,
        P120 = 0.1455,
        P130 = 0.1503,
        P140 = 0.1527,
        P150 = 0.1551,
        P160 = 0.1576,
        P170 = 0.16
    }
}



local RunService = game:GetService("RunService")

local function zeroOutYVelocity(hrp)
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        local hrp = character:WaitForChild("HumanoidRootPart")
        zeroOutYVelocity(hrp)
    end)
end

local function onPlayerRemoving(player)
    player.CharacterAdded:Disconnect()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i, player in pairs(game.Players:GetChildren()) do
            if player.Name ~= game.Players.LocalPlayer.Name then
                local hrp = player.Character.HumanoidRootPart
                zeroOutYVelocity(hrp)
            end
        end
    end)
end)
local Players, Client, Mouse, RS, Camera =
    game:GetService("Players"),
    game:GetService("Players").LocalPlayer,
    game:GetService("Players").LocalPlayer:GetMouse(),
    game:GetService("RunService"),
    game.Workspace.CurrentCamera
local Circle = Drawing.new("Circle")
Circle.Color = Color3.new(0,255,255)
Circle.Thickness = 1

local UpdateFOV = function ()
    if (not Circle) then
        return Circle
    end
    Circle.Visible = Pluto.FOV["Visible"]
    Circle.Radius = Pluto.FOV["Radius"] * 3
    Circle.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
    return Circle
end

RS.Heartbeat:Connect(UpdateFOV)

ClosestPlrFromMouse = function()
    local Target, Closest = nil, 1/0
 
    for _ ,v in pairs(Players:GetPlayers()) do
        if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
            local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude

            if (Circle.Radius > Distance and Distance < Closest and OnScreen) then
                Closest = Distance
                Target = v
            end
        end
    end
    return Target
end


local WTS = function (Object)
    local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local IsOnScreen = function (Object)
    local IsOnScreen = Camera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end

local FilterObjs = function (Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end

local GetClosestBodyPart = function (character)
    local ClosestDistance = 1/0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _,  x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (Circle.Radius > Distance and Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end

Mouse.KeyDown:Connect(function(key)
    if key == Pluto.Silent.Keybind and Pluto.Silent.Enabled then
        getgenv().Pluto.Silent.Enabled = false
    elseif key == Pluto.Silent.Keybind and not Pluto.Silent.Enabled then
        getgenv().Pluto.Silent.Enabled = true
    end
end)

local Prey

task.spawn(function ()
    while task.wait() do
        if Prey then
            if Pluto.Silent.Enabled and Pluto.Silent.ClosestPart == true then
                Pluto.Silent["Part"] = tostring(GetClosestBodyPart(Prey.Character))
            end
        end
    end
end)

local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
    if (Pluto.Silent.Enabled and Mouse and tostring(v) == "Hit") then

        Prey = ClosestPlrFromMouse()

        if Prey then
            local endpoint = game.Players[tostring(Prey)].Character[Pluto.Silent["Part"]].CFrame + (
                game.Players[tostring(Prey)].Character[Pluto.Silent["Part"]].Velocity * Pluto.Silent.Pred
            )
            return (tostring(v) == "Hit" and endpoint)
        end
    end
    return backupindex(self, v)
end)

while Pluto.AutoPred.Enabled == true do
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local pingValue = string.split(ping, " ")[1]
    local pingNumber = tonumber(pingValue)
    
    if pingNumber < 30 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P30
    elseif pingNumber < 40 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P40
    elseif pingNumber < 50 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P50
    elseif pingNumber < 60 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P60
    elseif pingNumber < 70 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P70
    elseif pingNumber < 80 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P80
    elseif pingNumber < 90 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P90
    elseif pingNumber < 100 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P100
    elseif pingNumber < 110 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P110
    elseif pingNumber < 120 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P120
    elseif pingNumber < 130 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P130
    elseif pingNumber < 140 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P140
    elseif pingNumber < 150 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P150
    elseif pingNumber < 160 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P160
    elseif pingNumber < 170 then
        getgenv().Pluto.Silent.Pred = Pluto.AutoPred.P170
    elseif pingNumber < 180 then
        getgenv().Pluto.Silent.Pred = 0.1923111
    elseif pingNumber < 190 then
        getgenv().Pluto.Silent.Pred = 0.19284
    elseif pingNumber < 200 then
        getgenv().Pluto.Silent.Pred = 0.166547
    elseif pingNumber < 210 then
        getgenv().Pluto.Silent.Pred = 0.16942
    elseif pingNumber < 260 then
        getgenv().Pluto.Silent.Pred = 0.1651
    elseif pingNumber < 310 then
        getgenv().Pluto.Silent.Pred = 0.16780
    end
    wait(0.1)
end
local Settings = {
    range1 = Pluto.MemSpoofer.Minimum,
    range2 = Pluto.MemSpoofer.Maximum
}

for __, v in pairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
    if v.Name == "PS_Button" and v.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
        Memory = v.StatsMiniTextPanelClass.ValueLabel
    end
end

Memory:GetPropertyChangedSignal("Text"):Connect(function()
    local Random = math.random(Settings.range1,Settings.range2)
    Random = Random * 1.23 
    Memory.Text = "".. Random .." MB"
end)
