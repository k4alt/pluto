getgenv().Kean = {
    AutoPred = {
        Enabled = false,
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
    Default = false, -- Default value (true / false)
    Tooltip = 'Toggles Auto Prediction', -- Information shown when you hover over the toggle
})


Toggles.MyToggle:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Pluto.AutoPred.Enabled = Toggles.MyToggle.Value
end)

Options.MyTextbox:OnChanged(function()
    getgenv().Pluto.Silent.Pred = Options.MyTextbox.Value
end)


-- This should print to the console: "My toggle state changed! New value: false"
Toggles.MyToggle:SetValue(false)

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
    Default = true, -- Default value (true / false)
    Tooltip = 'Sets Part to Nearest From Mouse', -- Information shown when you hover over the toggle
})

Toggles.MyToggle2:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Pluto.Silent.ClosestPart = Toggles.MyToggle2.Value
end)



LeftGroupBox:AddInput('MyTextboxKeyPl', {
    Default = 'k',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Keybind',
    Tooltip = 'Sets the Keybind', -- Information shown when you hover over the textbox

    Placeholder = 'Toggle Key', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextboxKeyPl:OnChanged(function()
    getgenv().Pluto.Silent.Keybind = Options.MyTextboxKeyPl.Value
end)


LeftGroupBox:AddToggle('MyToggleUseKey', {
    Text = 'Use Keybind',
    Default = true, -- Default value (true / false)
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
    getgenv().AimlockKey = Options.MyTextboxKey.Value
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
    Max = 1,
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
    getgenv().ThirdPerson = Toggles.MyToggleTP.Value
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

local LGroupBox = Tabs.Misc:AddLeftGroupbox('Blatant')

LGroupBox:AddToggle('NoSlowToggle', {
    Text = 'No-Slow',
    Default = true, -- Default value (true / false)
    Tooltip = 'Removes Slowness', -- Information shown when you hover over the toggle
})

-- Calls the passed function when the toggle is updated
Toggles.NoSlowToggle:OnChanged(function()
    local NoSlow = Toggles.NoSlowToggle.Value
end)

LGroupBox:AddToggle('JumpCooldownToggle', {
    Text = 'No-JumpCooldown',
    Default = false, -- Default value (true / false)
    Tooltip = 'Removes Jump Cooldown', -- Information shown when you hover over the toggle
})

-- Calls the passed function when the toggle is updated
Toggles.JumpCooldownToggleToggle:OnChanged(function()
    local NoJump = Toggles.JumpCooldownToggle.Value
end)

LGroupBox:AddToggle('NoDisplayToggle', {
    Text = 'No-DisplayNames',
    Default = false, -- Default value (true / false)
    Tooltip = 'Removes Display Names', -- Information shown when you hover over the toggle
})

-- Calls the passed function when the toggle is updated
Toggles.JumpCooldownToggleToggle:OnChanged(function()
    local NoDisplay = Toggles.NoDisplayToggle.Value
end)
