local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
local split = string.split(pingvalue,'(')
local ping = tonumber(split[1])


if Pluto.AutoPred.Enabled then
    if ping >= 0 and ping <= 10 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P10
    elseif ping > 10 and ping <= 20 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P20
    elseif ping > 20 and ping <= 30 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P30
    elseif ping > 30 and ping <= 40 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P40
    elseif ping > 40 and ping <= 50 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P50
    elseif ping > 50 and ping <= 60 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P60
    elseif ping > 60 and ping <= 70 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P70
    elseif ping > 70 and ping <= 80 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P80
    elseif ping > 80 and ping <= 90 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P90
    elseif ping > 90 and ping <= 100 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P100
    elseif ping > 100 and ping <= 110 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P110
    elseif ping > 110 and ping <= 120 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P120
    elseif ping > 120 and ping <= 130 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P130
    elseif ping > 130 and ping <= 140 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P140
    elseif ping > 140 and ping <= 150 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P150
    elseif ping > 150 and ping <= 160 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P160
    elseif ping > 160 and ping <= 170 then
        getgenv().Pluto.Silent.Prediction = Pluto.AutoPred.P170
    end
end


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
Circle.Color = joecolor
Circle.Thickness = 1

local UpdateFOV = function ()
    if (not Circle) then
        return Circle
    end
    Circle.Color = joecolor
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
if usekeybindtoggle then
    Mouse.KeyDown:Connect(function(key)
        if key == Pluto.Silent.Keybind and Pluto.Silent.Enabled then
            getgenv().Pluto.Silent.Enabled = false
        elseif key == Pluto.Silent.Keybind and not Pluto.Silent.Enabled then
            getgenv().Pluto.Silent.Enabled = true
        end
    end)
end

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
