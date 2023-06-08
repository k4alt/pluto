getgenv().Pluto = {
    Silent = {
        ["Enabled"] = (true), -- // Enable or disable the silent aim
        ["Keybind"] = ("k"), -- // The keybind that enables/disables the silent aim
        ["UseKeybind"] = (true), -- // Use the keybind to enable/disable the silent aim
        ["Prediction"] = (0.136), -- // Adjusts the prediction value
        ["AutoPrediction"] = (false), -- // Automatically calculates a good prediction value
        ["Part"] = ("Head"), -- // The targeted body part
        ["AirPart"] = ("LowerTorso"), -- // The targeted body part when the player is not on the ground
        ["UseAirPart"] = (false), -- // Use the AirPart when the target is not on the ground
        ["ClosestPart"] = (false), -- // Automatically target the closest part of the target
        ["ClosestPoint"] = (false), -- // Automatically target the closest point on the target part
        ["AntiGroundShots"] = (true), -- // Prevent shooting the ground
        ["HitChance"] = (100), -- // The chance to hit the target

        ["TriggerBot"] = (false), -- // Automatically shoots
        ["UseTriggerBotKeybind"] = (false), -- // Enable/disable TriggerBot with a keybind
        ["TriggerBotKey"] = ("MouseButton3"), -- // Keybind to enable/disable TriggerBot
    },
    Checks = {
        ["WallCheck"] = (true), -- // Check if there's a wall obstructing the target
        ["CheckIf_KO"] = (true), -- // Check if the target is knocked out or grabbed
        ["CheckIf_TargetDeath"] = (true), -- // Check if the target is dead
        ["CrewCheck"] = (false), -- // Check if the target is in your crew
        ["FriendCheck"] = (false) -- // Check if the target is your friend
    },
    MemSpoofer = {
        ["Enabled"] = true,
        ["Minimum"] = 500,
        ["Maximum"] = 800
    },
    GunFOV = {
        ["Enabled"] = (false), -- // Automatically adjust FOV based on equipped gun
        ["Double-Barrel SG"] = {["FOV"] = 22}, -- // FOV for Double-Barrel SG
        ["Revolver"] = {["FOV"] = 6.2}, -- // FOV for Revolver
        ["SMG"] = {["FOV"] = 3}, -- // FOV for SMG
        ["Shotgun"] = {["FOV"] = 18}, -- // FOV for Shotgun
        ["Rifle"] = {["FOV"] = 3}, -- // FOV for Rifle
        ["TacticalShotgun"] = {["FOV"] = 20}, -- // FOV for Tactical Shotgun
        ["Silencer"] = {["FOV"] = 2.8}, -- // FOV for Silencer
        ["AK47"] = {["FOV"] = 2.8}, -- // FOV for AK47
        ["AR"] = {["FOV"] = 2.8} -- // FOV for AR
    },
    Macro = {
        ["Enabled"] = true,
        ["Keybind"] = "q" -- // Keybind to enable/disable macros
    },
    RangeFOV = {
        ["Enabled"] = (true), -- // Gun FOV / FOV Is Automatically Changed To Specific Distance Between Target / This Will OverWrite GunFOV
        
        ["Far_Activation"] = (math.huge), -- // Just Keep It At Math.Huge
        ["Medium_Activation"] = (42), -- // Its Using Studs
        ["Close_Activation"] = (16), -- // Its Uisng Studs
        
        ["Double-Barrel SG"] = {["Far"] = 12, ["Med"] = 15, ["Close"] = 23}, -- // Db
        ["Revolver"] = {["Far"] = 10, ["Med"] = 17, ["Close"] = 21}, -- // Rev
        ["SMG"] = {["Far"] = 8, ["Med"] = 10, ["Close"] = 13}, -- // Smg
        ["Shotgun"] = {["Far"] = 11, ["Med"] = 15, ["Close"] = 19}, -- // Shotgun
        ["Rifle"] = {["Far"] = 3, ["Med"] = 4, ["Close"] = 6}, -- // Rifle
        -- // You Can Add Custom Weapons If You Want To :p
    },
    SilentFOV = {
        ["Visible"] = (false), -- // If The Circle Is Showing Or Not
        ["Filled"] = (false), -- // If The Circle Is Filled
        ["Transparency"] = (1), -- // The Circle Transparency
        ["Color"] = (Color3.fromRGB(87, 237, 255)), -- // Circle Transparency
        ["Radius"] = (10) -- // How Big The Circle Is
    },
    Tracer = {
        ["Enabled"] = (true), -- // Use The Aim Assist Or Not
        
        ["Key"] = ("c"), -- // The Key To Lock Onto A Player
        ["HoldMode"] = (false), -- // Enables While Only Holding The Key
        
        ["Part"] = ("UpperTorso"), -- // The Part That Aim Assist Locks On
        ["ClosestPart"] = (false), -- // Automatically Gets The Closest Part Of The Target And Uses That
        
        ["DisableTargetDeath"] = (true), -- // Disables When Target Dies
        ["DisableLocalDeath"] = (true), -- // Disables When You Died
        ["DisableOn_KO"] = (true), -- // Disables If Target Is KO Or Grabbed
        
        ["UseCircleRadius"] = (true), -- // Only Locks On To People Inside The Circle
        ["DisableOutSideCircle"] = (false), -- // If Target Is OutSide The Circle It Disables The Aim Assist
        
        ["UseShake"] = (true), -- // Shakes The Camera
        ["ShakeValue"] = (55), -- // How Much It Shakes
        
        ["PredictMovement"] = (true), -- // Predicts Targets MoveMent
        ["Prediction"] = (0.22), -- // How Much It Predicts
        
        ["WallCheck"] = (true), -- // Checks If Theres A Wall
        
        ["Smoothness_X"] = (0.053251), -- // How Smooth The Aim Assist Is On X
        ["Smoothness_Y"] = (0.053251) -- // How Smooth The Aim Assist Is On Y
    },
    TracerFOV = {
        ["Visible"] = (false), -- // If The Circle Is Showing Or Not
        ["Filled"] = (false), -- // If The Circle Is Filled
        ["Transparency"] = (0.5), -- // Circle Transparency
        ["Color"] = (Color3.fromRGB(255, 87, 87)), -- // Circle Transparency
        ["Radius"] = (70) -- // How Big The Circle Is
    },
    AutoPred = {
        ["P10"] = 0.07,
        ["P20"] = 0.155,
        ["P30"] = 0.132,
        ["P40"] = 0.136,
        ["P50"] = 0.130,
        ["P60"] = 0.136,
        ["P70"] = 0.138,
        ["P80"] = 0.138,
        ["P90"] = 0.146,
        ["P100"] = 0.14322,
        ["P110"] = 0.146,
        ["P120"] = 0.149,
        ["P130"] = 0.151,
        ["P140"] = 0.1223333,
        ["P150"] = 0.15,
        ["P160"] = 0.16,
        ["P170"] = 0.1923111,
        ["P180"] = 0.166547,
        ["P190"] = 0.166547
    },
    Resolver = {
        ["DetectDesync"] = (true), -- // Detects Velocity Changer + Actually Hits
        ["DesyncDetection"] = (86), -- // When It Detects
        ["UsDetectDesyncKeybind"] = (false), -- // Enable / Disable Desync Detection Keybind
        ["DetectDesyncKey"] = ("t"), -- // KeyBind To Enable / Disable Desync Detection

        ["DetectUnderGround"] = (true), -- // Detects Common UnderGround Resolver
        ["UnderGroundDetection"] = (-30), -- // When It Detects
        ["UseUnderGroundKeybind"] = (false), -- // Enable / Disable UnderGround Resolver Keybind
        ["UnderGroundKey"] = ("X"), -- // KeyBind To Enable / Disable UnderGround Resolver
        
        ["VisibleCheck"] = (true), -- // Checks If Target Is Visible
        ["CrewCheck"] = (false), -- // Checks If Target Is In Your Crew
        ["FriendCheck"] = (false), -- // Checks If Target Is Your Friend
        ["TeamCheck"] = (false), -- // Checks If Player Is In the Same Team
        
        ["AntiAimViewer"] = (true),
        ["Notifications"] = (true) -- // Sends Notification When you Enabled / Disabled Stuff
    },
    Commands = {
        ["Enabled"] = (true), -- // Enable / Disable Chat Command

        ["Silent_Enabled"] = (".sen"), -- // The Command To Enable / Disable Silent (With false/true)
        ["Silent_Prediction"] = (".spred"), -- // The Command To Change Silent Prediction (With Numbers)
        ["Silent_FOV_Size"] = (".sfov"), -- // The Command To Change Silent FOV (With Numbers)
        ["Silent_FOV_Show"] = (".sshow"), -- // The Command To Change Silent (With false/true)
        ["Silent_HitChance"] = (".schance"), -- // The Command To Change Silent HitChance (With Numbers)

        ["Tracer_Enabled"] = (".ten"), -- // The Command To Enable / Disable Tracer (With false/true)
        ["Tracer_Prediction"] = (".tpred"), -- // The Command To Change Tracer Prediction (With Numbers)
        ["Tracer_FOV_Size"] = (".tfov"), -- // The Command To Change Tracer FOV (With Numbers)
        ["Tracer_FOV_Show"] = (".tshow"), -- // The Command To Change Tracer (With false/true)
        ["Tracer_SmoothX"] = (".smoothx"), -- // The Command To Change Tracer SmoothNess X Value (With Numbers)
        ["Tracer_SmoothY"] = (".smoothy"), -- // The Command To Change Tracer SmoothNess Y Value (With Numbers)
        ["Tracer_Shake"] = (".shake"), -- // The Command To Change Tracer Shake Value (With Numbers)

        ["CrashGame"] = ("lol"), -- // The Command To Crash Roblox
    },
    Esp = {
        ["Enabled"] = (false), -- // Enabel / Disable Esp
        ["UseKeybind"] = (true), -- // Enable / Disable Esp Keybind
        ["Keybind"] = ("p"), -- // KeyBind To Enable / Disable Esp
        ["HoldMode"] = (true), -- // Enables While Only Holding The Key
        
        ["Name"] = {["Enabled"] = true, ["OutLine"] = true, ["Color"] = Color3.fromRGB(255, 255, 255)}, -- // Shows Targets Name
        ["Box"] = {["Enabled"] = true, ["OutLine"] = true, ["Color"] = Color3.fromRGB(255, 255, 255)}, -- // Shows Box On Target
    }
}


getgenv().Pluto.Silent.TriggerBot = (false)
getgenv().Pluto.Silent.UseTriggerBotKeybind = (false)
getgenv().Pluto.Silent.TriggerBotKey = ("MouseButton3")
getgenv().Pluto.Silent.Humanize = (false)
getgenv().Pluto.Esp.HealthBar = {Enabled = false, OutLine = false, Color = Color3.fromRGB(0, 255, 0)} -- // Shows An Health Bar On Target
getgenv().Pluto.Esp.Distance = {Enabled = false, OutLine = false, Color = Color3.fromRGB(255, 255, 255)} -- // Shows Targets Distance Between You
getgenv().Pluto.Esp.HealthText = {Enabled = false, OutLine = false, Color = Color3.fromRGB(0, 255, 0)} -- // Shows An Text How Much Hp Target Have
getgenv().Pluto.Silent.HumanizeValue = (2)
getgenv().Pluto.Silent.AntiGroundValue = (0.5) -- // How Much Velocity It Rmoves From Target
getgenv().Pluto.Silent.WhenAntiGroundActivate = (-20) -- // When Its Gonna Activate
getgenv().UseLay = (false) -- // Enable / Disable Lay Keybind
getgenv().LayKeybind = ("v") -- // KeyBind To Lay
getgenv().WallCheck = (Pluto.Checks.WallCheck)
getgenv().CheckIf_KO = (Pluto.Checks.CheckIf_KO)
getgenv().CheckIf_TargetDeath = (Pluto.Checks.CheckIf_TargetDeath)
getgenv().Pluto.Silent.PredictMovement = (true)
getgenv().Pluto.Silent.AntiAimViewer = (Pluto.Resolver.AntiAimViewer)
if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(...)
        return (...)
    end
    LPH_NO_VIRTUALIZE = function(...)
        return (...)
    end
end

LPH_JIT_MAX(function()
-- // Variables (Too Lazy To Make It To One Local)
local Pluto = getgenv().Pluto
local OldSilentAimPart = Pluto.Silent.Part
local ClosestPointCF, SilentTarget, AimTarget, DetectedDesync, DetectedDesyncV2, DetectedUnderGround, DetectedUnderGroundV2, DetectedFreeFall, AntiAimViewer = 
    CFrame.new(), 
    nil, 
    nil, 
    false, 
    false, 
    false, 
    false, 
    false, 
    true
local Script = {Functions = {}, Friends = {}, Drawing = {}, EspPlayers = {}}

local Players, Client, Mouse, RS, Camera, GuiS, Uis, Ran =
    game:GetService("Players"),
    game:GetService("Players").LocalPlayer,
    game:GetService("Players").LocalPlayer:GetMouse(),
    game:GetService("RunService"),
    game:GetService("Workspace").CurrentCamera,
    game:GetService("GuiService"),
    game:GetService("UserInputService"),
    math.random

-- // Drawing For Tracer And SilentAim
Script.Drawing.SilentCircle = Drawing.new("Circle")
Script.Drawing.SilentCircle.Color = Color3.new(1,1,1)
Script.Drawing.SilentCircle.Thickness = 1

Script.Drawing.TracerCircle = Drawing.new("Circle")
Script.Drawing.TracerCircle.Color = Color3.new(1,1,1)
Script.Drawing.TracerCircle.Thickness = 1

-- // Chat Check
Client.Chatted:Connect(function(Msg)
    if Msg == Pluto.Commands.CrashGame then
        while true do end
    end
    local Splitted = string.split(Msg, " ")
    if Splitted[1] and Splitted[2] and Pluto.Commands.Enabled then
        if Splitted[1] == Pluto.Commands.Silent_Prediction then
            Pluto.Silent.Prediction = Splitted[2]
        elseif Splitted[1] == Pluto.Commands.Silent_FOV_Size then
            Pluto.SilentFOV.Radius = Splitted[2]
        elseif Splitted[1] == Pluto.Commands.Silent_FOV_Show then
            if Splitted[2] == "true" then
                Pluto.SilentFOV.Visible = true
            else
                Pluto.SilentFOV.Visible = false
            end
        elseif Splitted[1] == Pluto.Commands.Silent_Enabled then
            if Splitted[2] == "true" then
                Pluto.Silent.Enabled = true
            else
                Pluto.Silent.Enabled = false 
            end
        elseif Splitted[1] == Pluto.Commands.Silent_HitChance then
            Pluto.Silent.HitChance = Splitted[2]
        elseif Splitted[1] == Pluto.Commands.Tracer_Prediction then
            Pluto.Tracer.Prediction = Splitted[2]
        elseif Splitted[1] == Pluto.Commands.Tracer_FOV_Size then
            Pluto.TracerFOV.Radius = Splitted[2]
        elseif Splitted[1] == Pluto.Commands.Tracer_FOV_Show then
            if Splitted[2] == "true" then
                Pluto.TracerFOV.Visible = true
            else
                Pluto.TracerFOV.Visible = false
            end
        elseif Splitted[1] == Pluto.Commands.Tracer_Enabled then
            if Splitted[2] == "true" then
                Pluto.Tracer.Enabled = true
            else
                Pluto.Tracer.Enabled = false
            end
        elseif Splitted[1] == Pluto.Commands.Tracer_SmoothX then
            Pluto.Tracer.Smoothness_X = Splitted[2]
        elseif Splitted[1] == Pluto.Commands.Tracer_SmoothY then
            Pluto.Tracer.Smoothness_Y = Splitted[2]
        elseif Splitted[1] == Pluto.Commands.Tracer_Shake then
            Pluto.Tracer.ShakeValue = Splitted[2]
        end
    end
end)
if Pluto.MemSpoofer.Enabled then
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
end

-- // KeyDown Check
Mouse.KeyDown:Connect(function(Key)
    local Keybind = Pluto.Tracer.Key:lower()
    if Key == Keybind then
        if Pluto.Tracer.Enabled then
            IsTargetting = not IsTargetting
            if IsTargetting then
                Script.Functions.GetClosestPlayer2()
            else
                if AimTarget ~= nil then
                    AimTarget = nil
                    IsTargetting = false
                end
            end
        end
    end
    local Keybind2 = Pluto.Silent.Keybind:lower()
    if Key == Keybind2 and Pluto.Silent.UseKeybind then
        Pluto.Silent.Enabled = not Pluto.Silent.Enabled
        if Pluto.Resolver.Notifications then
            game.StarterGui:SetCore("Notifications",{
                Title = "Pluto.cc",
                Text = "Silent Aim: " .. tostring(Pluto.Silent.Enabled),
                Icon = "rbxassetid://12225612888",
                Duration = 1
            })
        end
    end
    local Keybind3 = Pluto.Resolver.UnderGroundKey:lower()
    if Key == Keybind3 and Pluto.Resolver.UseUnderGroundKeybind then
        Pluto.Resolver.DetectUnderGround = not Pluto.Resolver.DetectUnderGround
        if Pluto.Resolver.Notifications then
            game.StarterGui:SetCore("Notifications",{
                Title = "Pluto.cc",
                Text = "UnderGround Resolver: " .. tostring(Pluto.Resolver.DetectUnderGround),
                Icon = "rbxassetid://12225612888",
                Duration = 1
            })
        end
    end
    local Keybind4 = Pluto.Resolver.DetectDesyncKey:lower()
    if Key == Keybind4 and Pluto.Resolver.UsDetectDesyncKeybind then
        Pluto.Resolver.DetectDesync = not Pluto.Resolver.DetectDesync
        if Pluto.Resolver.Notifications then
            game.StarterGui:SetCore("Notifications",{
                Title = "Pluto.cc",
                Text = "Desync Resolver: " .. tostring(Pluto.Resolver.DetectDesync),
                Icon = "rbxassetid://12225612888",
                Duration = 1
            })
        end
    end
    local Keybind6 = Pluto.Esp.Keybind:lower()
    if Key == Keybind6 and Pluto.Esp.UseKeybind then
		if Pluto.Esp.HoldMode then
			Pluto.Esp.Enabled = true
		else
			Pluto.Esp.Enabled = not Pluto.Esp.Enabled
		end
    end
end)

if Pluto.Macro.Enabled then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/k4alt/pluto/main/shit/macro.lua"))()
end

-- // KeyUp Check
Mouse.KeyUp:Connect(function(Key)
    local Keybind = Pluto.Esp.Keybind:lower()
    if Key == Keybind and Pluto.Esp.UseKeybind and Pluto.Esp.HoldMode then
		Pluto.Esp.Enabled = false
    end
    local Keybind2 = Pluto.Tracer.Key:lower()
    if Key == Keybind2 and Pluto.Tracer.Enabled and Pluto.Tracer.HoldMode then
        IsTargetting = false
		AimTarget = nil
    end
end)

-- // Disabled If AntiAimViewer Is On
if Pluto.Silent.AntiAimViewer then
    AntiAimViewer = false
else
    AntiAimViewer = true
end

-- // Blocks Mouse Triggering
game:GetService("ContextActionService"):BindActionAtPriority(
    "LeftMouseBlock",
    function()
        if AntiAimViewer == false and Pluto.Silent.AntiAimViewer and Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
            return Enum.ContextActionResult.Sink
        else
            return Enum.ContextActionResult.Pass
        end
    end,
    true,
    Enum.ContextActionPriority.Low.Value,
    Enum.UserInputType.MouseButton1
)

-- // Delaying The Mouse Trigger
Uis.InputBegan:connect(function(input)
    if input.UserInputType == Enum.UserInputType[Pluto.Silent.TriggerBotKey] and Pluto.Silent.UseTriggerBotKeybind then
        Pluto.Silent.TriggerBot = true
    end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and Pluto.Silent.AntiAimViewer and Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
        if AntiAimViewer == false then
            AntiAimViewer = true
            mouse1click()
            RS.RenderStepped:Wait()
            RS.RenderStepped:Wait()
            mouse1press()
            RS.RenderStepped:Wait()
            RS.RenderStepped:Wait()
            AntiAimViewer = false
        end
    end
end)

-- // Helps With Automatics
Uis.InputEnded:connect(function(input)
    if input.UserInputType == Enum.UserInputType[Pluto.Silent.TriggerBotKey] and Pluto.Silent.UseTriggerBotKeybind then
        Pluto.Silent.TriggerBot = true
    end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and Pluto.Silent.AntiAimViewer and Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
        if AntiAimViewer == false then
            AntiAimViewer = true
            mouse1click()
            RS.RenderStepped:Wait()
            RS.RenderStepped:Wait()
            mouse1click()
            RS.RenderStepped:Wait()
            RS.RenderStepped:Wait()
            AntiAimViewer = true
        end
    end
end)

-- // Checks If The Player Is Alive
Script.Functions.Alive = LPH_NO_VIRTUALIZE(function(Plr)
    if Plr and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and Plr.Character:FindFirstChild("Humanoid") ~= nil and Plr.Character:FindFirstChild("Head") ~= nil then
        return true
    end
    return false
end)

-- // Checks If Player Is On Your Screen
Script.Functions.OnScreen = LPH_NO_VIRTUALIZE(function(Object)
    local _, screen = Camera:WorldToScreenPoint(Object.Position)
    return screen
end)

-- // Gets Magnitude From Part Position And Mouse
Script.Functions.GetMagnitudeFromMouse = LPH_NO_VIRTUALIZE(function(Part)
    local PartPos, OnScreen = Camera:WorldToScreenPoint(Part.Position)
    if OnScreen then
        local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        return Magnitude
    end
    return math.huge
end)

-- // Makes Random Number With Vector3 
Script.Functions.RandomVec = LPH_NO_VIRTUALIZE(function(Number, Multi)
    return (Vector3.new(Ran(-Number, Number), Ran(-Number, Number), Ran(-Number, Number)) * Multi or 1)
end)

-- // Checks If The Player Is Behind A Wall Or Something Else
Script.Functions.RayCastCheck = LPH_NO_VIRTUALIZE(function(Part, PartDescendant)
    local Character = Client.Character or Client.CharacterAdded.Wait(Client.CharacterAdded)
    local Origin = Camera.CFrame.Position

    local RayCastParams = RaycastParams.new()
    RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
    RayCastParams.FilterDescendantsInstances = {Character, Camera}

    local Result = Workspace.Raycast(Workspace, Origin, Part.Position - Origin, RayCastParams)
    
    if (Result) then
        local PartHit = Result.Instance
        local Visible = (not PartHit or Instance.new("Part").IsDescendantOf(PartHit, PartDescendant))
        
        return Visible
    end
    return false
end)

-- // Gets The Part From An Object
Script.Functions.GetParts = LPH_NO_VIRTUALIZE(function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end)

-- // Random Number To Compare
Script.Functions.CalculateChance = LPH_NO_VIRTUALIZE(function(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100

    return chance < Percentage / 100
end)

-- // Check If Crew Folder Is A Thing
Script.Functions.FindCrew = LPH_NO_VIRTUALIZE(function(Player)
	if Player:FindFirstChild("DataFolder") and Player.DataFolder:FindFirstChild("Information") and Player.DataFolder.Information:FindFirstChild("Crew") and Client:FindFirstChild("DataFolder") and Client.DataFolder:FindFirstChild("Information") and Client.DataFolder.Information:FindFirstChild("Crew") then
        if Client.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= "" and Client.DataFolder.Information:FindFirstChild("Crew").Value ~= "" then 
			return true
		end
	end
	return false
end)

-- // Splits The Gun Name And Splits []
Script.Functions.GetGunName = LPH_NO_VIRTUALIZE(function(Name)
    local split = string.split(string.split(Name, "[")[2], "]")[1]
    return split
end)

-- // Gets Current Gun
Script.Functions.GetCurrentWeaponName = LPH_NO_VIRTUALIZE(function()
    if Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
       local Tool =  Client.Character:FindFirstChildWhichIsA("Tool")
       if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
          return Script.Functions.GetGunName(Tool.Name)
       end
    end
    return nil
end)

-- // Drawing Function With Property Attached
Script.Functions.NewDrawing = LPH_NO_VIRTUALIZE(function(Type, Properties)
    local NewDrawing = Drawing.new(Type)

    for i,v in next, Properties or {} do
        NewDrawing[i] = v
    end
    return NewDrawing
end)

-- // Draws For The New Players Joining For Esp
Script.Functions.NewPlayer = LPH_NO_VIRTUALIZE(function(Player)
    Script.EspPlayers[Player] = {
        Name = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(255,2550, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        BoxOutline = Script.Functions.NewDrawing("Square", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        Box = Script.Functions.NewDrawing("Square", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Visible = false}),
        HealthBarOutline = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        HealthBar = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(0, 255, 0), Thickness = 1, Visible = false}),
        HealthText = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(0, 255, 0), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        Distance = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0})
    }
end)

-- // Gets The Closest Part From Cursor
Script.Functions.GetClosestBodyPart = LPH_NO_VIRTUALIZE(function(Char)
    local Distance = math.huge
    local ClosestPart = nil
    local Filterd = {}

    if not (Char and Char:IsA("Model")) then
        return ClosestPart
    end

    local Parts = Char:GetChildren()
    for _, v in pairs(Parts) do
        if Script.Functions.GetParts(v) and Script.Functions.OnScreen(v) then
            table.insert(Filterd, v)
            for _, Part in pairs(Filterd) do                
                local Magnitude = Script.Functions.GetMagnitudeFromMouse(Part)
                if Magnitude < Distance then
                    ClosestPart = Part
                    Distance = Magnitude
                end
            end
        end
    end
    return ClosestPart
end)

-- // Gets The Closest Point From Cursor
Script.Functions.GetClosestPointOfPart = LPH_NO_VIRTUALIZE(function(Part)
    local NearestPosition = nil
    if Part ~= nil then
        local Hit, Half = Mouse.Hit.Position, Part.Size * 0.5
        local Transform = Part.CFrame:PointToObjectSpace(Mouse.Hit.Position)
        NearestPosition = Part.CFrame * Vector3.new(math.clamp(Transform.X, -Half.X, Half.X),math.clamp(Transform.Y, -Half.Y, Half.Y),math.clamp(Transform.Z, -Half.Z, Half.Z))
    end
    return NearestPosition
end)

-- // Gets The Closest Player For Cursor (Silent Aim)
Script.Functions.GetClosestPlayer = LPH_NO_VIRTUALIZE(function()
    local Target = nil
    local Closest = math.huge
    local HitChance = Script.Functions.CalculateChance(Pluto.Silent.HitChance)

    if not HitChance then
        return nil
    end
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart") then
            if not Script.Functions.OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if Pluto.Silent.WallCheck and not Script.Functions.RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            if Pluto.Silent.CheckIf_KO and v.Character:FindFirstChild("BodyEffects") then
                local KoCheck = v.Character.BodyEffects:FindFirstChild("K.O").Value
                local Grabbed = v.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
                if KoCheck or Grabbed then
                    continue
                end
            end
            if Pluto.Silent.CheckIf_TargetDeath and v.Character:FindFirstChild("Humanoid") then
                if v.Character.Humanoid.health < 4 then
                    continue
                end
            end
            if Pluto.Resolver.VisibleCheck and v.Character:FindFirstChild("Head") then
                if v.Character.Head.Transparency > 0.5 then
                    continue
                end
            end
            if Pluto.Resolver.CrewCheck and Script.Functions.FindCrew(v) and v.DataFolder.Information:FindFirstChild("Crew").Value == Client.DataFolder.Information:FindFirstChild("Crew").Value then
                continue
            end
            if Pluto.Resolver.TeamCheck then
                if v.Team ~= Client.Team then
                    continue
                end
            end
            if Pluto.Resolver.FriendCheck then
                if not table.find(Script.Friends, v.UserId) then
                    continue
                end
            end
            local Distance = Script.Functions.GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

            if (Distance < Closest and Script.Drawing.SilentCircle.Radius + 10 > Distance) then
                Closest = Distance
                Target = v
            end
        end
    end

    SilentTarget = Target
end)

-- // Gets Closest Player From Mouse (Tracer)
Script.Functions.GetClosestPlayer2 = LPH_NO_VIRTUALIZE(function()
    local Target = nil
    local Distance = nil
    local Closest = math.huge
    
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart") then
            if not Script.Functions.OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if Pluto.Tracer.WallCheck and not Script.Functions.RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            local Distance = Script.Functions.GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

            if Distance < Closest then
                if (Pluto.Tracer.UseCircleRadius and Script.Drawing.TracerCircle.Radius + 10 < Distance) then continue end
                Closest = Distance
                Target = v
            end
        end
    end

    if Script.Functions.Alive(Target) then
		if Pluto.Resolver.VisibleCheck then
			if Target.Character.Head.Transparency > 0.5 then
				return nil
			end
		end
		if Pluto.Resolver.CrewCheck and Script.Functions.FindCrew(Target) and Target.DataFolder.Information:FindFirstChild("Crew").Value == Client.DataFolder.Information:FindFirstChild("Crew").Value then
			return nil
		end
	end
    if Pluto.Resolver.TeamCheck and Target then
        if Target.Team == Client.Team then
            return nil
        end
    end
    if Pluto.Resolver.FriendCheck then
        if table.find(Script.Friends, Target.UserId) then
            return nil
        end
    end
    
    AimTarget = Target
end)

-- // Server Side Mouse Position Changer
local OldIndex = nil 
OldIndex = hookmetamethod(game, "__index", LPH_NO_VIRTUALIZE(function(self, Index)
    if not checkcaller() and Mouse and self == Mouse and Index == "Hit" and Pluto.Silent.Enabled and AntiAimViewer then
        if Script.Functions.Alive(SilentTarget) and Players[tostring(SilentTarget)].Character:FindFirstChild(Pluto.Silent.Part) then
            local EndPoint = nil
            local TargetCF = nil
            local TargetVel = Players[tostring(SilentTarget)].Character.HumanoidRootPart.Velocity
            local TargetMov = Players[tostring(SilentTarget)].Character.Humanoid.MoveDirection

            if Pluto.Silent.ClosestPoint then
                TargetCF = ClosestPointCF
            else
                TargetCF = Players[tostring(SilentTarget)].Character[Pluto.Silent.Part].CFrame
            end

            if Pluto.Resolver.DetectDesync then
                local Magnitude = TargetVel.magnitude
                local Magnitude2 = TargetMov.magnitude
                if Magnitude > Pluto.Resolver.DesyncDetection then
                    DetectedDesync = true
                elseif Magnitude < 1 and Magnitude2 > 0.01 then
                    DetectedDesync = true
                elseif Magnitude > 5 and Magnitude2 < 0.01 then
                    DetectedDesync = true
                else
                    DetectedDesync = false
                end
            else
                DetectedDesync = false
            end
            if Pluto.Silent.AntiGroundShots then
                if TargetVel.Y < Pluto.Silent.WhenAntiGroundActivate then
                    DetectedFreeFall = true
                else
                    DetectedFreeFall = false
                end
            end
            if Pluto.Resolver.DetectUnderGround then 
                if TargetVel.Y < Pluto.Resolver.UnderGroundDetection then            
                    DetectedUnderGround = true
                else
                    DetectedUnderGround = false
                end
            else
                DetectedUnderGround = false
            end
            
            if TargetCF ~= nil then
                if DetectedDesync then
                    local MoveDirection = TargetMov * 16
                    EndPoint = TargetCF + (MoveDirection * Pluto.Silent.Prediction)
                elseif DetectedUnderGround then
                    EndPoint = TargetCF + (Vector3.new(TargetVel.X, 0, TargetVel.Z) * Pluto.Silent.Prediction)
                elseif DetectedFreeFall then
                    EndPoint = TargetCF + (Vector3.new(TargetVel.X, (TargetVel.Y * Pluto.Silent.AntiGroundValue), TargetVel.Z) * Pluto.Silent.Prediction)
                elseif Pluto.Silent.PredictMovement then
                    EndPoint = TargetCF + (Vector3.new(TargetVel.X, (TargetVel.Y * 0.5), TargetVel.Z) * Pluto.Silent.Prediction)
                else
                    EndPoint = TargetCF
                end
                if Pluto.Silent.Humanize then
                    local HumanizeValue = Pluto.Silent.HumanizeValue 
                    EndPoint = (EndPoint + Script.Functions.RandomVec(HumanizeValue, 0.01))
                end
            end

            if EndPoint ~= nil then
                return (Index == "Hit" and EndPoint)
            end
        end
    end
    return OldIndex(self, Index)
end))

-- // Silent Aim Resolver
Script.Functions.SilentResolver = LPH_NO_VIRTUALIZE(function()
    if Pluto.Silent.Enabled and Script.Functions.Alive(SilentTarget) then
        if Pluto.Silent.UseAirPart then
            if SilentTarget.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                   Pluto.Silent.Part = Pluto.Silent.AirPart
            else
                Pluto.Silent.Part = OldSilentAimPart
            end
        end
        if Pluto.Silent.TriggerBot then
			mouse1click()
		end
    end
     if Pluto.Silent.AutoPrediction then
        local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        if ping < 10 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P10
        elseif ping < 20 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P20
        elseif ping < 30 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P30
        elseif ping < 40 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P40
        elseif ping < 50 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P50
        elseif ping < 60 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P60
        elseif ping < 70 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P70
        elseif ping < 80 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P80
        elseif ping < 90 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P90
        elseif ping < 100 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P100
        elseif ping < 110 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P110
        elseif ping < 120 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P120
        elseif ping < 130 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P130
        elseif ping < 140 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P140
        elseif ping < 150 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P150
        elseif ping < 160 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P160
        elseif ping < 170 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P170
        elseif ping < 180 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P180
        elseif ping > 190 then
            Pluto.Silent.Prediction = Pluto.AutoPred.P190
        end
    end
end)

-- // The Tracer Mouse Dragging/Check Functions
Script.Functions.MouseChanger = LPH_NO_VIRTUALIZE(function()
    if Pluto.Tracer.Enabled and Script.Functions.Alive(AimTarget) and Players[tostring(AimTarget)].Character:FindFirstChild(Pluto.Tracer.Part) and Script.Functions.OnScreen(Players[tostring(AimTarget)].Character[Pluto.Tracer.Part]) then
        local EndPosition = nil
        local TargetPos = Players[tostring(AimTarget)].Character[Pluto.Tracer.Part].Position
        local TargetVel = Players[tostring(AimTarget)].Character[Pluto.Tracer.Part].Velocity
        local TargetMov = Players[tostring(AimTarget)].Character.Humanoid.MoveDirection

        if Pluto.Resolver.DetectDesync then
            local Magnitude = TargetVel.magnitude
            local Magnitude2 = TargetMov.magnitude
            if Magnitude > Pluto.Resolver.DesyncDetection then
                DetectedDesyncV2 = true
            elseif Magnitude < 1 and Magnitude2 > 0.01 then
                DetectedDesyncV2 = true
            elseif Magnitude > 5 and Magnitude2 < 0.01 then
                DetectedDesyncV2 = true
            else
                DetectedDesyncV2 = false
            end
        else
            DetectedDesyncV2 = false
        end
        if Pluto.Resolver.DetectUnderGround then 
            if TargetVel.Y < Pluto.Resolver.UnderGroundDetection then            
                DetectedUnderGroundV2 = true
            else
                DetectedUnderGroundV2 = false
            end
        else
            DetectedUnderGroundV2 = false
        end

        if Script.Functions.Alive(Client) then
            if Pluto.Tracer.DisableLocalDeath then
                if Client.Character.Humanoid.health < 4 then
                    AimTarget = nil
                    IsTargetting = false
                    return
                end
            end
            if Pluto.Tracer.DisableOutSideCircle then
                local Magnitude = Script.Functions.GetMagnitudeFromMouse(AimTarget.Character.HumanoidRootPart)
                if Script.Drawing.TracerCircle.Radius < Magnitude then
                    AimTarget = nil
                    IsTargetting = false
                    return
                end
            end
        end

        if Pluto.Tracer.DisableOn_KO and AimTarget.Character:FindFirstChild("BodyEffects") then 
            local KoCheck = AimTarget.Character.BodyEffects:FindFirstChild("K.O").Value
            local Grabbed = AimTarget.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KoCheck or Grabbed then
                AimTarget = nil
                IsTargetting = false
                return
            end
        end
        if Pluto.Tracer.DisableTargetDeath then
            if AimTarget.Character.Humanoid.health < 4 then
                AimTarget = nil
                IsTargetting = false
                return
            end
        end

        if DetectedDesyncV2 and Pluto.Tracer.PredictMovement then
            local MoveDirection = TargetMov * 16
            EndPosition = Camera:WorldToScreenPoint(TargetPos + (MoveDirection * Pluto.Tracer.Prediction))
        elseif DetectedUnderGroundV2 and Pluto.Tracer.PredictMovement then
            EndPosition = Camera:WorldToScreenPoint(TargetPos + (Vector3.new(TargetVel.X, 0, TargetVel.Z) * Pluto.Tracer.Prediction))
        elseif Pluto.Tracer.PredictMovement then
            if Pluto.Tracer.UseShake and Script.Functions.Alive(Client) then
                local Shake = Pluto.Tracer.ShakeValue / 100
                local Mag = math.ceil((TargetPos - Client.Character.HumanoidRootPart.Position).Magnitude)
                EndPosition = Camera:WorldToScreenPoint(TargetPos + (TargetVel * Pluto.Tracer.Prediction) + Script.Functions.RandomVec(Mag * Shake, 0.1))
            else
                EndPosition = Camera:WorldToScreenPoint(TargetPos + (TargetVel * Pluto.Tracer.Prediction))
            end
        else
            if Pluto.Tracer.UseShake and Script.Functions.Alive(Client) then
                local Shake = Pluto.Tracer.ShakeValue / 100
                local Mag = math.ceil((TargetPos - Client.Character.HumanoidRootPart.Position).Magnitude)
                EndPosition = Camera:WorldToScreenPoint(TargetPos + Script.Functions.RandomVec(Mag * Shake, 0.1))
            else
                EndPosition = Camera:WorldToScreenPoint(TargetPos)
            end
        end

        if EndPosition ~= nil then
            local InCrementX = (EndPosition.X - Mouse.X) * Pluto.Tracer.Smoothness_X
            local InCrementY = (EndPosition.Y - Mouse.Y) * Pluto.Tracer.Smoothness_Y
            mousemoverel(InCrementX, InCrementY)
        end
    end
end)

--// Update Size/Position Of Circle
Script.Functions.UpdateFOV = LPH_NO_VIRTUALIZE(function()
    if (not Script.Drawing.SilentCircle and not Script.Drawing.TracerCircle) then
        return Script.Drawing.SilentCircle and Script.Drawing.TracerCircle
    end
    
    Script.Drawing.TracerCircle.Visible = Pluto.TracerFOV.Visible
    Script.Drawing.TracerCircle.Filled = Pluto.TracerFOV.Filled
    Script.Drawing.TracerCircle.Color = Pluto.TracerFOV.Color
    Script.Drawing.TracerCircle.Transparency = Pluto.TracerFOV.Transparency
    Script.Drawing.TracerCircle.Position = Vector2.new(Mouse.X, Mouse.Y + GuiS:GetGuiInset().Y)
	Script.Drawing.TracerCircle.Radius = Pluto.TracerFOV.Radius * 3
    
    Script.Drawing.SilentCircle.Visible = Pluto.SilentFOV.Visible
    Script.Drawing.SilentCircle.Color = Pluto.SilentFOV.Color
    Script.Drawing.SilentCircle.Filled = Pluto.SilentFOV.Filled
    Script.Drawing.SilentCircle.Transparency = Pluto.SilentFOV.Transparency
    Script.Drawing.SilentCircle.Position = Vector2.new(Mouse.X, Mouse.Y + GuiS:GetGuiInset().Y)
	Script.Drawing.SilentCircle.Radius = Pluto.SilentFOV.Radius * 3
	
    if Pluto.RangeFOV.Enabled or Pluto.GunFOV.Enabled then
		local CurrentGun = Script.Functions.GetCurrentWeaponName()
		if Pluto.GunFOV.Enabled then
			local WeaponSettings = Pluto.GunFOV[CurrentGun]
			if WeaponSettings ~= nil then
				Pluto.SilentFOV.Radius = WeaponSettings.FOV
			end
		end
		if Pluto.RangeFOV.Enabled then
			local WeaponSettingsV2 = Pluto.RangeFOV[CurrentGun]
			if WeaponSettingsV2 ~= nil then
				if Script.Functions.Alive(SilentTarget) and Script.Functions.Alive(Client) then
                    local Magnitude = (SilentTarget.Character.HumanoidRootPart.Position - Client.Character.HumanoidRootPart.Position).Magnitude
					if Magnitude < Pluto.RangeFOV.Close_Activation then
						Pluto.SilentFOV.Radius = WeaponSettingsV2.Close
					elseif Magnitude < Pluto.RangeFOV.Medium_Activation then
						Pluto.SilentFOV.Radius = WeaponSettingsV2.Med
					elseif Magnitude < Pluto.RangeFOV.Far_Activation then
						Pluto.SilentFOV.Radius = WeaponSettingsV2.Far
					end
				end
			end
		end
	end
end)

-- // Updates Esp Posistions
Script.Functions.UpdateEsp = LPH_NO_VIRTUALIZE(function()
    for i,v in pairs(Script.EspPlayers) do
        if Pluto.Esp.Enabled and i ~= Client and i.Character and i.Character:FindFirstChild("Humanoid") and i.Character:FindFirstChild("HumanoidRootPart") and i.Character:FindFirstChild("Head") then
            local Hum = i.Character.Humanoid
            local Hrp = i.Character.HumanoidRootPart
            
            local Vector, OnScreen = Camera:WorldToViewportPoint(i.Character.HumanoidRootPart.Position)
            local Size = (Camera:WorldToViewportPoint(Hrp.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(Hrp.Position + Vector3.new(0, 2.6, 0)).Y) / 2
            local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
            local BoxPos = Vector2.new(math.floor(Vector.X - Size * 1.5 / 2), math.floor(Vector.Y - Size * 1.6 / 2))
            local BottomOffset = BoxSize.Y + BoxPos.Y + 1

            if OnScreen then
                if Pluto.Esp.Name.Enabled then
                    v.Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    v.Name.Outline = Pluto.Esp.Name.OutLine
                    v.Name.Text = tostring(i)
                    v.Name.Color = Pluto.Esp.Name.Color
                    v.Name.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.Name.Font = 0
                    v.Name.Size = 16

                    v.Name.Visible = true
                else
                    v.Name.Visible = false
                end
                if Pluto.Esp.Distance.Enabled and Client.Character and Client.Character:FindFirstChild("HumanoidRootPart") then
                    v.Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                    v.Distance.Outline = Pluto.Esp.Distance.OutLine
                    v.Distance.Text = "[" .. math.floor((Hrp.Position - Client.Character.HumanoidRootPart.Position).Magnitude) .. "m]"
                    v.Distance.Color = Pluto.Esp.Distance.Color
                    v.Distance.OutlineColor = Color3.fromRGB(0, 0, 0)
                    BottomOffset = BottomOffset + 15

                    v.Distance.Font = 0
                    v.Distance.Size = 16

                    v.Distance.Visible = true
                else
                    v.Distance.Visible = false
                end
                if Pluto.Esp.Box.Enabled then
                    v.BoxOutline.Size = BoxSize
                    v.BoxOutline.Position = BoxPos
                    v.BoxOutline.Visible = Pluto.Esp.Box.OutLine
                    v.BoxOutline.Color = Color3.fromRGB(0, 0, 0)
    
                    v.Box.Size = BoxSize
                    v.Box.Position = BoxPos
                    v.Box.Color = Pluto.Esp.Box.Color
                    v.Box.Visible = true
                else
                    v.BoxOutline.Visible = false
                    v.Box.Visible = false
                end
                if Pluto.Esp.HealthBar.Enabled then
                    v.HealthBar.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    v.HealthBar.To = Vector2.new(v.HealthBar.From.X, v.HealthBar.From.Y - (Hum.Health / Hum.MaxHealth) * BoxSize.Y)
                    v.HealthBar.Color = Pluto.Esp.HealthBar.Color
                    v.HealthBar.Visible = true

                    v.HealthBarOutline.From = Vector2.new(v.HealthBar.From.X, BoxPos.Y + BoxSize.Y + 1)
                    v.HealthBarOutline.To = Vector2.new(v.HealthBar.From.X, (v.HealthBar.From.Y - 1 * BoxSize.Y) -1)
                    v.HealthBarOutline.Color = Color3.fromRGB(0, 0, 0)
                    v.HealthBarOutline.Visible = Pluto.Esp.HealthBar.OutLine
                else
                    v.HealthBarOutline.Visible = false
                    v.healthBar.Visible = false
                end
                if Pluto.Esp.HealthText.Enabled then
                    v.HealthText.Text = tostring(math.floor((Hum.Health / Hum.MaxHealth) * 100 + 0.5))
                    v.HealthText.Position = Vector2.new((BoxPos.X - 20), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) -1)
                    v.HealthText.Color = Pluto.Esp.HealthText.Color
                    v.HealthText.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.HealthText.Outline = Pluto.Esp.HealthText.OutLine

                    v.HealthText.Font = 0
                    v.HealthText.Size = 16

                    v.HealthText.Visible = true
                else
                    v.HealthText.Visible = false
                end
            else
                v.Name.Visible = false
                v.BoxOutline.Visible = false
                v.Box.Visible = false
                v.HealthBarOutline.Visible = false
                v.HealthBar.Visible = false
                v.HealthText.Visible = false
                v.Distance.Visible = false
            end
        else
            v.Name.Visible = false
            v.BoxOutline.Visible = false
            v.Box.Visible = false
            v.HealthBarOutline.Visible = false
            v.HealthBar.Visible = false
            v.HealthText.Visible = false
            v.Distance.Visible = false
        end
    end
end)

-- // Client Fps (EXECUTES PER FRAME)
RS.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
    Script.Functions.GetClosestPlayer()
    Script.Functions.SilentResolver()
    Script.Functions.MouseChanger()
end))

-- // Server Tick (EXECUTES PER TICK)
RS.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
    Script.Functions.UpdateEsp()
    Script.Functions.UpdateFOV()
    if Pluto.Silent.Enabled and Pluto.Silent.ClosestPoint and Script.Functions.Alive(SilentTarget) and Players[tostring(SilentTarget)].Character:FindFirstChild(Pluto.Silent.Part) then
        local ClosestPoint = Script.Functions.GetClosestPointOfPart(Players[tostring(SilentTarget)].Character[Pluto.Silent.Part])
        ClosestPointCF = CFrame.new(ClosestPoint.X, ClosestPoint.Y, ClosestPoint.Z)
    end
    if Pluto.Tracer.Enabled and Script.Functions.Alive(AimTarget) and Pluto.Silent.ClosestPart and Script.Functions.Alive(SilentTarget) then
        local currentpart = tostring(Script.Functions.GetClosestBodyPart(AimTarget.Character))
        if Pluto.Tracer.ClosestPart then
			Pluto.Tracer.Part = currentpart
		end
        if Pluto.Silent.ClosestPart then
            Pluto.Silent.Part = currentpart
            OldSilentAimPart = Pluto.Silent.Part
        end
        return
    end
    if Pluto.Tracer.Enabled and Pluto.Tracer.ClosestPart and Script.Functions.Alive(AimTarget) then
        Pluto.Tracer.Part = tostring(Script.Functions.GetClosestBodyPart(AimTarget.Character))
    end
    if Pluto.Silent.Enabled and Pluto.Silent.ClosestPart and Script.Functions.Alive(SilentTarget) then
        Pluto.Silent.Part = tostring(Script.Functions.GetClosestBodyPart(SilentTarget.Character))
        OldSilentAimPart = Pluto.Silent.Part
    end
end))

-- // Checks Everyone In The Server And Puts It In A Table
for _, Player in ipairs(Players:GetPlayers()) do
    if (Player ~= Client and Client:IsFriendsWith(Player.UserId)) then
        table.insert(Script.Friends, Player)
    end
    Script.Functions.NewPlayer(Player)
end

-- // Checks When Players Joins And Adds Them To A Table
Players.PlayerAdded:Connect(function(Player)
    if (Client:IsFriendsWith(Player.UserId)) then
        table.insert(Script.Friends, Player)
    end
    Script.Functions.NewPlayer(Player)
end)

-- // Checks If A Player Left And Removes Them From The Table
Players.PlayerRemoving:Connect(function(Player)
    local i = table.find(Script.Friends, Player)
    if (i) then
        table.remove(Script.Friends, i)
    end
    for i,v in pairs(Script.EspPlayers[Player]) do
        v:Remove()
    end
    Script.EspPlayers[Player] = nil
end)

end)()
