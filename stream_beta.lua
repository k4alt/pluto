getgenv().Pluto = {
    Silent = {
        Enabled = true,
        UseKeybind = false,
        Keybind = "X",
        Prediction = 0.1,
        AimPart = "UpperTorso",
        ClosestPart = true,
    },
    Tracer = {
        Enabled = false,
        Keybind = "C",
        Predict = true,
        Prediction = 0.1267,
        Smoothness = 0.4,
        Aimpart = "UpperTorso",
        ClosestPart = false,
        DisableOnEnemyDeath = true,
        DisableOnOwnDeath = true,
        Shake = {
            Enabled = true,
            Amount = 100
        },
    },
    FOV = {
        Silent = {
            ShowFOV = true,
            UseKeybind = true,
            Keybind = "Z",
            Filled = false,
            FOV = 15,
            NumSides = 100,
            Color = Color3.fromRGB(255, 0, 0),
            Thickness = 1,
            Transparency = 0.7
        },
        Tracer = {
            Enabled = false,
            ShowFOV = false,
            UseKeybind = false,
            Keybind = "M",
            Filled = false,
            FOV = 30,
            NumSides = 100,
            Color = Color3.fromRGB(0, 0, 0),
            Thickness = 1,
            Transparency = 0.7
        }
    },
    Checks = {
        KOCheck = true,
        WallCheck = true,
        CrewCheck = false,
        FriendCheck = false,
        VelocityCheck = true
    },
    GunFOV = {
        Enabled = true,
        DoubleBarrel = 22.5,
        Revolver = 27.5,
        Shotgun = 35,
        TacticalShotgun = 35,
        Smg = 25,
        Rifle = 50,
        Silencer = 32.5,
        SilencerAR = 32.5,
        Glock = 100,
        AK47 = 25,
        AR = 42
    },
    Customize = {
        HitChance = {
            Enabled = false,
            GroundHitChance = 0,
            AirHitChance = 0
        },
        Prediction = {
            Enabled = false,
            GroundPrediction = 0,
            AirPrediction = 0
        },
        Smoothness = {
            Enabled = false,
            GroundSmoothness = 0,
            AirSmoothness = 0
        },
        Shake = {
            Enabled = false,
            GroundShake = 0,
            AirShake = 0
        }
    },
    RangeManagement = {
        Enabled = false,
        Type = "Both", 
        Close = {
            CloseDetection = 5,
            CloseFOV = 60,
            ClosePrediction = 0.121
        },
        Mid = {
            MidDetection = 15,
            MidFOV = 45,
            MidPrediction = 0.127
        },
        Far = {
            FarDetection = 25,
            FarFOV = 35,
            FarPrediction = 0.131
        },
        VeryFar = {
            VeryFarDetection = math.huge,
            VeryFarFOV = 20,
            VeryFarPrediction = 0.134
        }
    },
    Resolver = {
        Enabled = true,
        UseKeybind = false,
        Keybind = "K"
    },
    Commands = {
        Enabled = true, 
        FOV = "?fov",
        Prediction = "?prediction",
        HitChance = "?hitchance",
    }
}


getgenv().Pluto.Silent.Predict = true
local Players = game:GetService("Players")
local Client = game:GetService("Players").LocalPlayer
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local Camera = game:GetService("Workspace").CurrentCamera
local Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
local SilentFOV = Drawing.new("Circle")
local TracerFOV = Drawing.new("Circle")
local SilentTarget
local TracerTarget

SilentFOV.Color = getgenv().Pluto.FOV.Silent.Color
SilentFOV.Thickness = getgenv().Pluto.FOV.Silent.Thickness
SilentFOV.Filled = getgenv().Pluto.FOV.Silent.Filled
SilentFOV.Transparency = getgenv().Pluto.FOV.Silent.Transparency
SilentFOV.NumSides = getgenv().Pluto.FOV.Silent.NumSides

TracerFOV.Color = getgenv().Pluto.FOV.Tracer.Color
TracerFOV.Thickness = getgenv().Pluto.FOV.Tracer.Thickness
TracerFOV.Filled = getgenv().Pluto.FOV.Tracer.Filled
TracerFOV.Transparency = getgenv().Pluto.FOV.Tracer.Transparency
TracerFOV.NumSides = getgenv().Pluto.FOV.Tracer.NumSides

local UpdateFOV = function()
    if not SilentFOV and TracerFOV then
        return SilentFOV and TracerFOV
    end
    SilentFOV.Visible = getgenv().Pluto.FOV.Silent.ShowFOV
    SilentFOV.Radius = getgenv().Pluto.FOV.Silent.FOV * 5
    SilentFOV.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))

    TracerFOV.Visible = getgenv().Pluto.FOV.Tracer.ShowFOV
    TracerFOV.Radius = getgenv().Pluto.FOV.Tracer.FOV * 5
    TracerFOV.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
    return SilentFOV and TracerFOV
end
RunService.Heartbeat:Connect(UpdateFOV)

local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)
grmt.__index = newcclosure(function(self, v)
    if (getgenv().Pluto.Silent.Enabled and Mouse and tostring(v) == "Hit") then
        if SilentTarget and SilentTarget.Character then
            if getgenv().Pluto.Silent.Predict then
                local endpoint = game.Players[tostring(SilentTarget)].Character[getgenv().Pluto.Silent.AimPart]
                                     .CFrame +
                                     (game.Players[tostring(SilentTarget)].Character[getgenv().Pluto.Silent.AimPart]
                                         .Velocity * getgenv().Pluto.Silent.Prediction)
                return (tostring(v) == "Hit" and endpoint)
            else
                local endpoint = game.Players[tostring(SilentTarget)].Character[getgenv().Pluto.Silent.AimPart]
                                     .CFrame
                return (tostring(v) == "Hit" and endpoint)
            end
        end
    end
    return backupindex(self, v)
end)

local WorldToScreenPoint = function(Object)
    local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end
local IsOnScreen = function(Object)
    local IsOnScreen = Camera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end
local NoMeshPart = function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end
local WallCheck = function(destination, ignore)
    local Origin = Camera.CFrame.p
    local CheckRay = Ray.new(Origin, destination - Origin)
    local Hit = game.workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
    return Hit == nil
end
local PlayerMouseFunction = function()
    local Target, Closest = nil, 1 / 0
    for _, v in pairs(Players:GetPlayers()) do
        if getgenv().Pluto.Checks.WallCheck then
            if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
                local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude

                if (SilentFOV.Radius > Distance and Distance < Closest and OnScreen) and
                    WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}) then
                    Closest = Distance
                    Target = v
                end
            end
        else
            if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
                local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude

                if (SilentFOV.Radius > Distance and Distance < Closest and OnScreen) then
                    Closest = Distance
                    Target = v
                end
            end
        end
    end
    return Target
end
local PlayerMouseFunction2 = function()
    local Target, Closest = nil, TracerFOV.Radius * 1.27
    for _, v in pairs(Players:GetPlayers()) do
        if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
            if getgenv().Pluto.Checks.WallCheck then
                local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (Distance < Closest and OnScreen) and
                    WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}) then
                    Closest = Distance
                    Target = v
                end
            else
                local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (Distance < Closest and OnScreen) then
                    Closest = Distance
                    Target = v
                end
            end
        end
    end
    return Target
end
local BodyPartFunction = function(character)
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if NoMeshPart(x) and IsOnScreen(x) then
                local Distance = (WorldToScreenPoint(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (SilentFOV.Radius > Distance and Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end
local BodyPartFunction2 = function(character)
    local ClosestDistance = 1 / 0
    local BodyPart = nil

    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if NoMeshPart(x) and IsOnScreen(x) then
                local Distance = (WorldToScreenPoint(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end
task.spawn(function()
    while task.wait() do
        if getgenv().Pluto.Silent.Enabled then
            SilentTarget = PlayerMouseFunction()
        end
        if TracerTarget then
            if getgenv().Pluto.Tracer.Enabled and (TracerTarget.Character) and
                getgenv().Pluto.Tracer.ClosestPart then
                getgenv().Pluto.Tracer.Aimpart = tostring(BodyPartFunction2(TracerTarget.Character))
            end
        end
        if SilentTarget then
            if getgenv().Pluto.Silent.Enabled and (SilentTarget.Character) and
                getgenv().Pluto.Silent.ClosestPart then
                getgenv().Pluto.Silent.AimPart = tostring(BodyPartFunction(SilentTarget.Character))
            end
        end
    end
end)
Mouse.KeyDown:Connect(function(Key)
    if getgenv().Pluto.FOV.Silent.UseKeybind then
        if (Key == getgenv().Pluto.FOV.Silent.Keybind:lower()) then
            if getgenv().Pluto.FOV.Silent.ShowFOV == true then
                getgenv().Pluto.FOV.Silent.ShowFOV = false
            else
                getgenv().Pluto.FOV.Silent.ShowFOV = true
            end
            if getgenv().Pluto.FOV.Tracer.UseKeybind then
                if (Key == getgenv().Pluto.FOV.Tracer.Keybind:lower()) then
                    if getgenv().Pluto.FOV.Tracer.ShowFOV == true then
                        getgenv().Pluto.FOV.Tracer.ShowFOV = false
                    else
                        getgenv().Pluto.FOV.Tracer.ShowFOV = true
                    end
                end
                if getgenv().Pluto.Silent.UseKeybind then
                    if (Key == getgenv().Pluto.Silent.Keybind:lower()) then
                        if getgenv().Pluto.Silent.Enabled == true then
                            getgenv().Pluto.Silent.Enabled = false
                        else
                            getgenv().Pluto.Silent.Enabled = true
                        end
                    end
                end
            end
        end
        if (Key == getgenv().Pluto.Tracer.Keybind:lower()) then
            if getgenv().Pluto.Tracer.Enabled == true then
                IsTargetting = not IsTargetting
                if IsTargetting then
                    TracerTarget = PlayerMouseFunction2()
                else
                    if TracerTarget ~= nil then
                        TracerTarget = nil
                        IsTargetting = false
                    end
                end
            end
        end
    end
    if getgenv().Pluto.Resolver.UseKeybind then
        if (Key == getgenv().Pluto.Resolver.Keybind:lower()) then
            if getgenv().Pluto.Resolver.Enabled == true then
                getgenv().Pluto.Resolver.Enabled = false
            else
                getgenv().Pluto.Resolver.Enabled = true
            end
        end
    end
end)
if getgenv().Pluto.Checks.CrewCheck then
    while true do
        local newPlayer = game.Players.PlayerAdded:wait()
        if player:IsInGroup(newPlayer.Group) then
            table.insert(Ignored.Players, newPlayer)
        end
    end
end
if getgenv().Pluto.Checks.FriendCheck then
    game.Players.PlayerAdded:Connect(function(SilentTarget)
        if Client:IsFriendsWith(SilentTarget) then
            local newPlayer = game.Players.PlayerAdded:wait()
            table.insert(Ignored.Players, newPlayer)
        end
    end)
end

RunService.Heartbeat:Connect(function()
    if getgenv().Pluto.Silent.Enabled then
        if SilentTarget and SilentTarget.Character and SilentTarget.Character:WaitForChild(getgenv().Pluto.Silent.AimPart) then
            if getgenv().Pluto.Resolver.Enabled == true and
            SilentTarget.Character:WaitForChild("HumanoidRootPart").Velocity.magnitude > 50 then
                pcall(function()
                    local TargetVel = SilentTarget.Character[getgenv().Pluto.Silent.AimPart]
                    TargetVel.Velocity = Vector3.new(0, 0, 0)
                    TargetVel.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                end)
            end
            if getgenv().Pluto.Checks.VelocityCheck == true and SilentTarget.Character:FindFirstChild("Humanoid") ==
                Enum.HumanoidStateType.Freefall then
                pcall(function()
                    local TargetVelv5 = SilentTarget.Character[getgenv().Pluto.Silent.AimPart]
                    TargetVelv5.Velocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 0.5),
                        TargetVelv5.Velocity.Z)
                    TargetVelv5.AssemblyLinearVelocity = Vector3.new(TargetVelv5.Velocity.X,
                        (TargetVelv5.Velocity.Y * 0.5), TargetVelv5.Velocity.Z)
                end)
            end
            if getgenv().Pluto.Resolver.Enabled == true then
                pcall(function()
                    local TargetVelv2 = SilentTarget.Character[getgenv().Pluto.Silent.AimPart]
                    TargetVelv2.Velocity = Vector3.new(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                    TargetVelv2.AssemblyLinearVelocity = Vector3.new(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                end)
            end
        end
    end
end)
getgenv().Extra = {
    ["Enabled"] = (getgenv().Pluto.GunFOV.Enabled),
    ["Double-Barrel SG"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.DoubleBarrel)
    },
    ["DoubleBarrel"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.DoubleBarrel)
    },
    ["Revolver"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.Revolver)
    },
    ["SMG"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.Smg)
    },
    ["Shotgun"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.Shotgun)
    },
    ["TacticalShotgun"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.TacticalShotgun)
    },
    ["Rifle"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.Rifle)
    },
    ["Silencer"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.Silencer)
    },
    ["SilencerAR"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.SilencerAR)
    },
    ["Glock"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.Glock)
    },
    ["AK47"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.AK47)
    },
    ["AR"] = {
        ["FOV"] = (getgenv().Pluto.GunFOV.AR)
    }
}

local Script = {
    Functions = {}
}
Script.Functions.getToolName = function(name)
    local split = string.split(string.split(name, "[")[2], "]")[1]
    return split
end
Script.Functions.getEquippedWeaponName = function()
    if (Client.Character) and Client.Character:FindFirstChildWhichIsA("Tool") then
        local Tool = Client.Character:FindFirstChildWhichIsA("Tool")
        if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and
            not string.find(Tool.Name, "Phone") then
            return Script.Functions.getToolName(Tool.Name)
        end
    end
    return nil
end
RunService.RenderStepped:Connect(function()
    if getgenv().Pluto.Silent.Enabled then
        if getgenv().Pluto.Checks.KOCheck == true and SilentTarget and SilentTarget.Character then
            local KOd = SilentTarget.Character:WaitForChild("BodyEffects")["K.O"].Value
            local Grabbed = SilentTarget.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KOd or Grabbed then
                SilentTarget = nil
            end
        end
    end
    if getgenv().Pluto.Tracer.Enabled == true then
        if getgenv().Pluto.Checks.KOCheck == true and TracerTarget and TracerTarget.Character then
            local KOd = TracerTarget.Character:WaitForChild("BodyEffects")["K.O"].Value
            local Grabbed = TracerTarget.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KOd or Grabbed then
                TracerTarget = nil
                IsTargetting = false
            end
        end
    end
    if getgenv().Pluto.Tracer.DisableOnEnemyDeath == true and TracerTarget and
    TracerTarget.Character:FindFirstChild("Humanoid") then
        if TracerTarget.Character.Humanoid.health < 2 then
            TracerTarget = nil
            IsTargetting = false
        end
    end
    if getgenv().Pluto.Tracer.DisableOnOwnDeath == true and TracerTarget and
    TracerTarget.Character:FindFirstChild("Humanoid") then
        if Client.Character.Humanoid.health < 2 then
            TracerTarget = nil
            IsTargetting = false
        end
    end
    if getgenv().Pluto.FOV.Tracer.Enabled == true and TracerTarget and TracerTarget.Character and
    TracerTarget.Character:WaitForChild("HumanoidRootPart") then
        if TracerFOV.Radius < (Vector2.new(Camera:WorldToScreenPoint(TracerTarget.Character.HumanoidRootPart.Position).X,
            Camera:WorldToScreenPoint(TracerTarget.Character.HumanoidRootPart.Position).Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude then
                TracerTarget = nil
            IsTargetting = false
        end
    end
    if getgenv().Pluto.Tracer.Predict and TracerTarget and TracerTarget.Character and
    TracerTarget.Character:FindFirstChild(getgenv().Pluto.Tracer.Aimpart) then
        if getgenv().Pluto.Tracer.Shake.Enabled then
            local Main = CFrame.new(Camera.CFrame.p,
            TracerTarget.Character[getgenv().Pluto.Tracer.Aimpart].Position +
                TracerTarget.Character[getgenv().Pluto.Tracer.Aimpart].Velocity *
                    getgenv().Pluto.Tracer.Prediction +
                    Vector3.new(math.random(-getgenv().Pluto.Tracer.Shake.Amount,
                        getgenv().Pluto.Tracer.Shake.Amount), math.random(
                        -getgenv().Pluto.Tracer.Shake.Amount,
                        getgenv().Pluto.Tracer.Shake.Amount), math.random(
                        -getgenv().Pluto.Tracer.Shake.Amount,
                        getgenv().Pluto.Tracer.Shake.Amount)) * 0.1)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Pluto.Tracer.Smoothness / 2,
                Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        else
            local Main = CFrame.new(Camera.CFrame.p,
            TracerTarget.Character[getgenv().Pluto.Tracer.Aimpart].Position +
                TracerTarget.Character[getgenv().Pluto.Tracer.Aimpart].Velocity *
                    getgenv().Pluto.Tracer.Prediction)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Pluto.Tracer.Smoothness / 2,
                Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        end
    elseif getgenv().Pluto.Tracer.Predict == false and TracerTarget and TracerTarget.Character and
    TracerTarget.Character:FindFirstChild(getgenv().Pluto.Tracer.Aimpart) then
        if getgenv().Pluto.Tracer.Shake.Enabled then
            local Main = CFrame.new(Camera.CFrame.p,
            TracerTarget.Character[getgenv().Pluto.Tracer.Aimpart].Position +
                    Vector3.new(math.random(-getgenv().Pluto.Tracer.Shake.Amount,
                        getgenv().Pluto.Tracer.Shake.Amount), math.random(
                        -getgenv().Pluto.Tracer.Shake.Amount,
                        getgenv().Pluto.Tracer.Shake.Amount), math.random(
                        -getgenv().Pluto.Tracer.Shake.Amount,
                        getgenv().Pluto.Tracer.Shake.Amount)) * 0.1)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Pluto.Tracer.Smoothness / 2,
                Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        else
            local Main =
                CFrame.new(Camera.CFrame.p, TracerTarget.Character[getgenv().Pluto.Tracer.Aimpart].Position)
            Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Pluto.Tracer.Smoothness / 2,
                Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        end
    end
    if Script.Functions.getEquippedWeaponName() ~= nil then
        local WeaponSettings = getgenv().Extra[Script.Functions.getEquippedWeaponName()]
        if WeaponSettings ~= nil and getgenv().Pluto.GunFOV.Enabled == true then
            getgenv().Pluto.FOV.Silent.FOV = WeaponSettings.FOV
        else
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.FOV.Silent.FOV
        end
    end
     if getgenv().Pluto.RangeManagement.Enabled and getgenv().Pluto.RangeManagement.Type == "Both" and Client ~= nil and
        (Client.Character) and SilentTarget and SilentTarget.Character then
        if (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Close.CloseDetection then
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.RangeManagement.Close.CloseFOV
            getgenv().Pluto.Silent.Prediction = getgenv().Pluto.RangeManagement.Close.ClosePrediction

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Mid.MidDetection then
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.RangeManagement.Mid.MidFOV
            getgenv().Pluto.Silent.Prediction = getgenv().Pluto.RangeManagement.Mid.MidPrediction

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Far.FarDetection then
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.RangeManagement.Far.FarFOV
            getgenv().Pluto.Silent.Prediction = getgenv().Pluto.RangeManagement.Far.FarPrediction

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.VeryFar.VeryFarDetection then
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.RangeManagement.VeryFar.VeryFarFOV
            getgenv().Pluto.Silent.Prediction = getgenv().Pluto.RangeManagement.VeryFar.VeryFarPrediction

        end
    end
    if getgenv().Pluto.RangeManagement.Enabled and getgenv().Pluto.RangeManagement.Type == "Prediction" and Client ~= nil and
        (Client.Character) and SilentTarget and SilentTarget.Character then
        if (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Close.CloseDetection then
            getgenv().Pluto.Silent.Prediction = getgenv().Pluto.RangeManagement.Close.ClosePrediction

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Mid.MidDetection then
            getgenv().Pluto.Silent.Prediction = getgenv().Pluto.RangeManagement.Mid.MidPrediction

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Far.FarDetection then
            getgenv().Pluto.Silent.Prediction = getgenv().Pluto.RangeManagement.Far.FarPrediction

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.VeryFar.VeryFarDetection then
            getgenv().Pluto.Silent.Prediction = getgenv().Pluto.RangeManagement.VeryFar.VeryFarPrediction

        end
    end
    if getgenv().Pluto.RangeManagement.Enabled and getgenv().Pluto.RangeManagement.Type == "FOV" and Client ~= nil and
        (Client.Character) and SilentTarget and SilentTarget.Character then
        if (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Close.CloseDetection then
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.RangeManagement.Close.CloseFOV

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Mid.MidDetection then
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.RangeManagement.Mid.MidFOV

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.Far.FarDetection then
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.RangeManagement.Far.FarFOV

        elseif (Client.Character.HumanoidRootPart.Position - SilentTarget.Character.HumanoidRootPart.Position).Magnitude <
            getgenv().Pluto.RangeManagement.VeryFar.VeryFarDetection then
            getgenv().Pluto.FOV.Silent.FOV = getgenv().Pluto.RangeManagement.VeryFar.VeryFarFOV

        end
    end
end)
if getgenv().Pluto.Customize.HitChance.Enabled then
    if SilentTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        getgenv().Pluto.Silent.HitChance = getgenv().Pluto.Customize.HitChance.AirHitChance
    else
        getgenv().Pluto.Silent.HitChance = getgenv().Pluto.Customize.HitChance.GroundHitChance
    end
end
if getgenv().Pluto.Customize.Prediction.Enabled then
    if SilentTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        getgenv().Pluto.Silent.Prediction = getgenv().Pluto.Customize.Prediction.AirPrediction
    else
        getgenv().Pluto.Silent.Prediction = getgenv().Pluto.Customize.Prediction.GroundPrediction
    end
end
if getgenv().Pluto.Customize.Smoothness.Enabled then
    if TracerTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        getgenv().Pluto.Tracer.Smoothness = getgenv().Pluto.Customize.Smoothness.AirSmoothness
    else
        getgenv().Pluto.Tracer.Smoothness = getgenv().Pluto.Customize.Smoothness.GroundSmoothness
    end
end
if getgenv().Pluto.Customize.Shake.Enabled then
    if TracerTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        getgenv().Pluto.Tracer.Shake.Amount = getgenv().Pluto.Customize.Shake.AirShake
    else
        getgenv().Pluto.Tracer.Shake.Amount = getgenv().Pluto.Customize.Shake.GroundShake
    end
end
Client.Commandsted:Connect(function(message)
    if getgenv().Pluto.Commands.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Pluto.Commands.FOV and args[2] ~= nil then
            getgenv().Pluto.FOV.Silent.FOV = tonumber(args[2])
        end
    end
    if getgenv().Pluto.Commands.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Pluto.Commands.Prediction and args[2] ~= nil then
            getgenv().Pluto.Silent.Prediction = tonumber(args[2])
        end
    end
    if getgenv().Pluto.Commands.Enabled then
        local args = string.split(message, " ")
        if args[1] == getgenv().Pluto.Commands.HitChance and args[2] ~= nil then
            getgenv().Pluto.Silent.HitChance = tonumber(args[2])
        end
    end
end)
