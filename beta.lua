wait(2)
-- shitty image
local IMAGE_ID = "rbxassetid://13483817463"

-- get services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- create screen gui to hold the shitty image
local Gui = Instance.new("ScreenGui")
Gui.Parent = LocalPlayer.PlayerGui

-- create a shitty image label to hold shitty image
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.BackgroundTransparency = 1
ImageLabel.Size = UDim2.new(0, 50, 0, 50) -- Set the initial size of the image label to small
ImageLabel.Image = IMAGE_ID
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0) -- Position the image label at the center of the screen
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Parent = Gui

-- create a tween to animate the shitty image label
local initialTween = game:GetService("TweenService"):Create(ImageLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, 200)}) -- tween make shitty image bigger, duration adjusted to 50% faster
local swingTween = game:GetService("TweenService"):Create(ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 360}) -- spinny the image 360 degrees in 0.5 seconds, duration adjusted to 50% faster
local fadeTween = game:GetService("TweenService"):Create(ImageLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}) -- tweeny to fade the shitty image out, duration adjusted to 50% faster

initialTween.Completed:Connect(function()
    swingTween:Play()
    wait(0.5) -- wait uh shitty image
    fadeTween:Play()
end)

initialTween:Play()
wait(1)
getgenv().Pluto = {
    Silent = {
        Enabled = false,
        Keybind = "k",
        Part = "UpperTorso",
        Pred = 0.136,
        ClosestPart = false,
    },
    FOV = {
        Visible = false,
        Radius = 30
    },
    MemSpoofer = {
        Enabled = true,
        Minimum = 500,
        Maximum = 800
    },
    AutoPred = {
        Enabled = true,
        P10 = 0.9,
        P20 = 0.12588,
        P30 = 0.11,
        P40 = 0.123,
        P50 = 0.132,
        P60 = 0.136,
        P70 = 0.1433431,
        P80 = 0.139,
        P90 = 0.14834,
        P100 = 0.15738,
        P110 = 0.1455,
        P120 = 0.1652131,
        P130 = 0.151,
        P140 = 0.153,
        P150 = 0.1923111,
        P160 = 0.16779123,
        P170 = 0.1923111
    }
}

getgenv().Kean = {
    Main = {
        Key = key21,
        Prediction = 4.5,
        Radius = 40,
        Part = "UpperTorso"
    },
    Config = {
        Smoothness = false,
        Amount = 0.35
    },
    Checks = {
        FirstPerson = true,
        ThirdPerson = true,
        JumpCheck = true
    },
    AutoPred = {
        Enabled = true,
        P40 = 9.6,
        P50 = 9.6,
        P60 = 7.64,
        P70 = 7.64,
        P80 = 7.64,
        P90 = 6.405,
        P100 = 6.7,
        P110 = 6.34,
        P120 = 6.34
    }

}
-- New example script written by wally
-- You can suggest changes with a pull request or something

local repo = 'https://raw.githubusercontent.com/k4alt/pluto/main/'

local Library = loadstring(game:HttpGet(repo .. 'library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'theme.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'save.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Pluto CC',
    Center = true, 
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'), 
    Misc = Window:AddTab('Misc'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Silent')

local MyButton = LeftGroupBox:AddButton('Load', function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/k4alt/pluto/main/src.lua"))()
end)

LeftGroupBox:AddToggle('MyToggleEn', {
    Text = 'Enabled',
    Default = true, -- Default value (true / false)
    Tooltip = 'Enables/Disables the silent aim', -- Information shown when you hover over the toggle
})

-- Fetching a toggle object for later use:
-- Toggles.MyToggle.Value

-- Toggles is a table added to getgenv() by the library
-- You index Toggles with the specified index, in this case it is 'MyToggle'
-- To get the state of the toggle you do toggle.Value

-- Calls the passed function when the toggle is updated
Toggles.MyToggleEn:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Pluto.Silent.Enabled = Toggles.MyToggleEn.Value
end)

-- Tabboxes are a tiny bit different, but here's a basic example:
--[[

local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side

local Tab1 = TabBox:AddTab('Tab 1')
local Tab2 = TabBox:AddTab('Tab 2')

-- You can now call AddToggle, etc on the tabs you added to the Tabbox
]]

-- Groupbox:AddToggle
-- Arguments: Index, Options



LeftGroupBox:AddInput('MyTextbox', {
    Default = '0.136',
    Numeric = true, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Sets the Prediction', -- Information shown when you hover over the textbox

    Placeholder = 'Prediction', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

LeftGroupBox:AddToggle('MyToggle', {
    Text = 'Auto-Pred',
    Default = true, -- Default value (true / false)
    Tooltip = 'Toggles Auto Prediction', -- Information shown when you hover over the toggle
})


-- Fetching a toggle object for later use:
-- Toggles.MyToggle.Value

-- Toggles is a table added to getgenv() by the library
-- You index Toggles with the specified index, in this case it is 'MyToggle'
-- To get the state of the toggle you do toggle.Value

-- Calls the passed function when the toggle is updated
Toggles.MyToggle:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Pluto.AutoPred.Enabled = Toggles.MyToggle.Value
end)

Options.MyTextbox:OnChanged(function()
    getgenv().Pluto.Silent.Pred = Options.MyTextbox.Value
end)


-- This should print to the console: "My toggle state changed! New value: false"
Toggles.MyToggle:SetValue(false)

-- Groupbox:AddButton
-- Arguments: Text, Callback


-- Groupbox:AddLabel
-- Arguments: Text, DoesWrap


-- Groupbox:AddDivider
-- Arguments: None

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = { 'HumanoidRootPart', 'UpperTorso', 'LowerTorso', 'Head'},
    Default = 2, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Part',
    Tooltip = 'What part to aim at (non closest part)', -- Information shown when you hover over the textbox
})

Options.MyDropdown:OnChanged(function()
    getgenv().Pluto.Silent.Part = Options.MyDropdown.Value
end)

LeftGroupBox:AddToggle('MyToggle2', {
    Text = 'Closest Part',
    Default = false, -- Default value (true / false)
    Tooltip = 'Sets Part to Nearest From Mouse', -- Information shown when you hover over the toggle
})

Toggles.MyToggle2:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Pluto.Silent.ClosestPart = Toggles.MyToggle2.Value
end)



LeftGroupBox:AddLabel('Keybind'):AddKeyPicker('KeyPicker', {
    -- SyncToggleState only works with toggles. 

    Default = 'k', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false, 


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Auto lockpick safes', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

Options.KeyPicker:OnClick(function()
    getgenv().Pluto.Silent.Keybind = Options.KeyPicker.Value
end)
LeftGroupBox:AddToggle('MyToggleUseKey', {
    Text = 'Use Keybind',
    Default = false, -- Default value (true / false)
    Tooltip = 'Use Silent Keybind', -- Information shown when you hover over the toggle
})

-- Calls the passed function when the toggle is updated
Toggles.MyToggleUseKey:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().usekeybindtoggle = Toggles.MyToggleUseKey.Value
end)

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('FOV')
-- Groupbox:AddSlider
-- Arguments: Idx, Options
LeftGroupBox:AddToggle('MyToggle3', {
    Text = 'Visible: ',
    Default = true, -- Default value (true / false)
    Tooltip = 'Toggles FOV Visibility', -- Information shown when you hover over the toggle
})



-- Calls the passed function when the toggle is updated
Toggles.MyToggle3:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Pluto.FOV.Visible = Toggles.MyToggle3.Value
end)

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Radius: ',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 25,
    Min = 1,
    Max = 75,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

-- Options is a table added to getgenv() by the library

local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
    getgenv().Pluto.FOV.Radius = Options.MySlider.Value
end)

-- This should print to the console: "MySlider was changed! New value: 3"
Options.MySlider:SetValue(3)
Toggles.MyToggle2:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Pluto.Silent.ClosestPart = Toggles.MyToggle.Value
end)



LeftGroupBox:AddLabel('Color: '):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0), -- Bright green
    Title = 'Some color', -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ColorPicker:OnChanged(function()
    joecolor = Options.ColorPicker.Value
end)

Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 247))












local RightGroupBox = Tabs.Main:AddRightGroupbox('Tracer')
local MyButton = RightGroupBox:AddButton('Load', function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/k4alt/pluto/main/camsrc.lua"))()
end)

RightGroupBox:AddInput('MyTextboxKey', {
    Default = 'q',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Keybind',
    Tooltip = 'Sets the Keybind', -- Information shown when you hover over the textbox

    Placeholder = 'Toggle Key', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxKey:OnChanged(function()
    getgenv().Kean.Main.Key = Options.MyTextboxKey.Value
end)

RightGroupBox:AddDropdown('MyDropdown2', {
    Values = { 'HumanoidRootPart', 'UpperTorso', 'LowerTorso', 'Head'},
    Default = 2, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Part',
    Tooltip = 'What part to aim at (non closest part)', -- Information shown when you hover over the textbox
})

Options.MyDropdown2:OnChanged(function()
    key21 = Options.MyDropdown2.Value
end)

RightGroupBox:AddInput('MyTextboxPred', {
    Default = '7.64',
    Numeric = true, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = 'Sets the Prediction', -- Information shown when you hover over the textbox

    Placeholder = 'Prediction Amount', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxPred:OnChanged(function()
    getgenv().PredictionVelocity = Options.MyTextboxPred.Value
end)
RightGroupBox:AddToggle('MyToggleAutoP', {
    Text = 'AutoPred',
    Default = true, -- Default value (true / false)
    Tooltip = 'Prediction based on your ping', -- Information shown when you hover over the toggle
})

Toggles.MyToggleAutoP:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Kean.AutoPred.Enabled = Toggles.MyToggleAutoP.Value
end)

RightGroupBox:AddToggle('MyToggleSmooth', {
    Text = 'Smoothness',
    Default = true, -- Default value (true / false)
    Tooltip = 'Smoothness (makes you look more legit)', -- Information shown when you hover over the toggle
})
RightGroupBox:AddSlider('MySliderAM', {
    Text = 'Smoothness: ',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 0.5,
    Min = 0.01,
    Max = 10,
    Rounding = 2,

    Compact = false, -- If set to true, then it will hide the label
})

-- Options is a table added to getgenv() by the library

Options.MySliderAM:OnChanged(function()
    getgenv().SmoothnessAmount = Options.MySliderAM.Value
end)

Toggles.MyToggleSmooth:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Smoothness = Toggles.MyToggleSmooth.Value
end)
local RightGroupBox = Tabs.Main:AddRightGroupbox('Checks')

RightGroupBox:AddToggle('MyToggleFP', {
    Text = 'First-Person',
    Default = true, -- Default value (true / false)
    Tooltip = 'Traces in first person', -- Information shown when you hover over the toggle
})

Toggles.MyToggleFP:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().FirstPerson = Toggles.MyToggleFP.Value
end)
RightGroupBox:AddToggle('MyToggleTP', {
    Text = 'Third-Person',
    Default = false, -- Default value (true / false)
    Tooltip = 'Traces in third person', -- Information shown when you hover over the toggle
})

Toggles.MyToggleTP:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().FirstPerson = Toggles.MyToggleTP.Value
end)

RightGroupBox:AddToggle('MyToggleJP', {
    Text = 'Jump-Check',
    Default = true, -- Default value (true / false)
    Tooltip = 'Traces them mid air', -- Information shown when you hover over the toggle
})

Toggles.MyToggleJP:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().CheckIfJumped = Toggles.MyToggleJP.Value
end)



-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)

-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'V', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 
-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config 
-- which has been marked to be one that auto loads!

local LeftGroupBox = Tabs.Misc:AddLeftGroupbox('Macro')

local MyButtonLoad = LeftGroupBox:AddButton('Load', function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FederalW/scripts/main/macro"))()
    getgenv().macrotype = "normal" -- normal or mouse
end)
LeftGroupBox:AddInput('MyTextboxMKey', {
    Default = 'q',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Keybind',
    Tooltip = 'Sets the Keybind', -- Information shown when you hover over the textbox

    Placeholder = 'Toggle Key', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxMKey:OnChanged(function()
    getgenv().Kean.Main.Key = Options.MyTextboxMKey.Value
end)
LeftGroupBox:AddSlider('MySliderMacro', {
    Text = 'Speed',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 1.1,
    Min = 0.3,
    Max = 2,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})
-- Options is a table added to getgenv() by the library

Options.MySliderMacro:OnChanged(function()
    getgenv().macrospeed = Options.MySliderMacro.Value
end)

getgenv().macrokey = "q"
