wait(3)
-- shitty image
local IMAGE_ID = "rbxassetid://13483817431"

-- get services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- create screen gui to hold the shitty image
local Gui = Instance.new("ScreenGui")
Gui.Parent = LocalPlayer.PlayerGui

-- create a shitty image label to hold shitty image
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.BackgroundTransparency = 1
ImageLabel.Size = UDim2.new(0, 1000, 0, 1000) -- Set the initial size of the image label to small
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
