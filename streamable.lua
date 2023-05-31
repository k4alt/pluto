getgenv().partlol = "Head"
getgenv().partt = "Head"

local Prey = nil 
local Plr = nil

local Players, Client, Mouse, RS, Camera =
game:GetService("Players"),
game:GetService("Players").LocalPlayer,
game:GetService("Players").LocalPlayer:GetMouse(),
game:GetService("RunService"),
game.Workspace.CurrentCamera

local Circle = Drawing.new("Circle")
Circle.Color = Color3.fromRGB(255, 255, 255)
Circle.Thickness = 1

local UpdateFOV = function ()
if (not Circle) then
    return Circle
end
Circle.Visible = getgenv().Pluto.FOV["Visible"]
Circle.Radius = getgenv().Pluto.FOV["Radius"] * 3
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
            wait(0.1)
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

local cam = workspace.CurrentCamera
local mouse = game.Players.LocalPlayer:GetMouse()
local circle = Drawing.new("Circle")
circle.Color = Color3.new(1,1,1)
circle.Visible = false
circle.Radius = 10 
local main

local function test()
    for i2,v2 in pairs(game:GetService("Workspace").Ignored:GetChildren()) do 
            if v2.Name == "BULLET_RAYS" then 
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v2.Position).Magnitude
                if mag > 20 then 
                    local w, onscreen = cam:WorldToViewportPoint(v2.Position)
                    circle.Position = Vector2.new(w.X,w.Y)
                    circle.Visible = true
                    main = v2.Position
                    mouse1click()
                end
            end
    end 
end

local Prey

task.spawn(function ()
while task.wait() do
    if Prey then
        if getgenv().Pluto.Silent.Enabled then
            getgenv().partlol = tostring(GetClosestBodyPart(Prey.Character))
        end
    end
end
end)

local function get_calculated_velocity(obj)
    if nil_check(obj) and obj.Character and obj.Character:FindFirstChild(partlol) then
        local root = obj.Character.HumanoidRootPart
        local character = obj.Character 

        local currentPosition = root.Position
        local currentTime = tick() 

        wait(0.00350) 

        local newPosition = root.Position
        local newTime = tick()

        local distanceTraveled = (newPosition - currentPosition) 

        local timeInterval = newTime - currentTime
        local velocity = distanceTraveled / timeInterval
        currentPosition = newPosition
        currentTime = newTime
        return velocity
    end
end

local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
if (getgenv().Pluto.Silent.Enabled and Mouse and tostring(v) == "Hit") then

    Prey = ClosestPlrFromMouse()

    if Prey then
        local endpoint = game.Players[tostring(Prey)].Character[getgenv().partlol].CFrame + (
            game.Players[tostring(Prey)].Character[getgenv().partlol].Velocity * getgenv().Pluto.Silent.Prediction
        )
        return (tostring(v) == "Hit" and endpoint)
    end
end
return backupindex(self, v)
end)

local CC = game.Workspace.CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local Plr

if Pluto.Silent.UseKeybind then
    Mouse.KeyDown:Connect(function(Key)
        local Keybind = getgenv().Pluto.Camlock.Key:lower()
        if (Key == Keybind) then
            if getgenv().Pluto.Camlock.Enabled == true then
                IsTargetting = not IsTargetting
                if IsTargetting then
                    Plr = GetClosest()
                else
                    if Plr ~= nil then
                        Plr = nil
                    end
                end
            end
        end
    end)   
end

function GetClosest()
    local closestPlayer
    local shortestDistance = math.huge
    for i, v in pairs(game.Players:GetPlayers()) do
        pcall(function()

            if v ~= game.Players.LocalPlayer and v.Character and
                v.Character:FindFirstChild("Humanoid") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude =
                (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                if (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end)
    end
    return closestPlayer
end

task.spawn(function()
    while task.wait() do
        if getgenv().Pluto.Camlock.Enabled and Plr ~= nil and (Plr.Character) then
            getgenv().partt = tostring(GetNearestPartToCursorOnCharacter(Plr.Character))
        end
    end
end)

local function IsOnScreen(Object)
    local IsOnScreen = game.Workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end

local function Filter(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if Object:IsA("Part") or Object:IsA("MeshPart") then
        return true
    end
end

local function WTSPos(Position)
    local ObjectVector = game.Workspace.CurrentCamera:WorldToScreenPoint(Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local function WTS(Object)
    local ObjectVector = game.Workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

function GetNearestPartToCursorOnCharacter(character)
    local ClosestDistance = math.huge
    local BodyPart = nil

    if (character and character:GetChildren()) then
        for k,  x in next, character:GetChildren() do
            if Filter(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
    
                if Distance < ClosestDistance then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end

    return BodyPart
end



RS.RenderStepped:Connect(function()
    if getgenv().Pluto.Checks.NoGroundShots == true and Prey.Character:FindFirstChild("Humanoid") == Enum.HumanoidStateType.Freefall then
        pcall(function()
            local TargetVelv5 = targ.Character[getgenv().partlol]
            TargetVelv5.Velocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
            TargetVelv5.AssemblyLinearVelocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
        end)
    end
    
if getgenv().Pluto.Checks.Death == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
			if Plr.Character.Humanoid.health < 2 then
				Plr = nil
				IsTargetting = false
			end
		end
		if getgenv().Pluto.Checks.Death == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
			if Client.Character.Humanoid.health < 2 then
				Plr = nil
				IsTargetting = false
			end
end
        if getgenv().Pluto.Checks.Knocked == true and Prey and Prey.Character then 
            local KOd = Prey.Character:waitForChild("BodyEffects")["K.O"].Value
            local Grabbed = Prey.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KOd or Grabbed then
                Prey = nil
            end
	end
        if getgenv().Pluto.Checks.Knocked == true and Plr and Plr.Character then 
            local KOd = Plr.Character:waitForChild("BodyEffects")["K.O"].Value
            local Grabbed = Plr.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KOd or Grabbed then
                Plr = nil
                IsTargetting = false
            end
        end
end)


game.RunService.Heartbeat:Connect(function()
        if getgenv().Pluto.Misc.Shake then
            local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().partt].Position + Plr.Character[getgenv().partt].Velocity * getgenv().Pluto.Camlock.Prediction +
            Vector3.new(
                math.random(-getgenv().Pluto.Misc.ShakeValue, getgenv().Pluto.Misc.ShakeValue),
                math.random(-getgenv().Pluto.Misc.ShakeValue, getgenv().Pluto.Misc.ShakeValue),
                math.random(-getgenv().Pluto.Misc.ShakeValue, getgenv().Pluto.Misc.ShakeValue)
            ) * 0.1)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Pluto.Camlock.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        else
            local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().partt].Position + Plr.Character[getgenv().partt].Velocity * getgenv().Pluto.Camlock.Prediction)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Pluto.Camlock.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        end
end)

if Pluto.Macro.Enabled then
    local Player = game:GetService("Players").LocalPlayer
            local Mouse = Player:GetMouse()
            local SpeedGlitch = false
            Mouse.KeyDown:Connect(function(Key)
                if Key == Pluto.Macro.Keybind then
                    SpeedGlitch = not SpeedGlitch
                    if SpeedGlitch == true then
                        repeat game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait(0.0000001)
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait(0.0000001)
                        until SpeedGlitch == false
                    end
                end
            end)
end
local Player = game:GetService("Players").LocalPlayer
            local Mouse = Player:GetMouse()
            local SpeedGlitch = false
            Mouse.KeyDown:Connect(function(Key)
                if Key == "q" then
                    SpeedGlitch = not SpeedGlitch
                    if SpeedGlitch == true then
                        repeat game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                                    wait(0.0000001)
                                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                                    wait(0.0000001)
                        until SpeedGlitch == false
                    end
                end
            end)


       

while getgenv().Pluto.Silent.AutoPrediction == true do
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local pingValue = string.split(ping, " ")[1]
    local pingNumber = tonumber(pingValue)
   
    if pingNumber < 30 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P30
        wait(0.7)
    elseif pingNumber < 40 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P40
        wait(0.7)
    elseif pingNumber < 50 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P50
    elseif pingNumber < 60 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P60
    elseif pingNumber < 70 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P70
    elseif pingNumber < 80 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P80
    elseif pingNumber < 90 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P90
    elseif pingNumber < 100 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P100
    elseif pingNumber < 110 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P110
         elseif pingNumber < 120 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P120
         elseif pingNumber < 130 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P130
         elseif pingNumber < 140 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P140
         elseif pingNumber < 150 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P150
         elseif pingNumber < 160 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P160
        elseif pingNumber < 170 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P170
        elseif pingNumber < 180 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P180
        elseif pingNumber < 190 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P190
        elseif pingNumber < 200 then
        Pluto.Silent.Prediction = Pluto.AutoPred.P200
        elseif pingNumber < 210 then
        Pluto.Silent.Prediction = 0.16942
        elseif pingNumber < 260 then
        Pluto.Silent.Prediction = 0.1651
        elseif pingNumber < 310 then
        Pluto.Silent.Prediction = 0.16780
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
