--Gui to Lua
local VirtualInputManager = game:GetService("VirtualInputManager")

local frameSize = UDim2.new(0, 64, 0, 64)
local framePosition = UDim2.new(0.5, 0, 0.5, 0) -- Centered
local frameColor = Color3.fromRGB(64,64,64) -- Gray

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DraggableFrameGui"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 10

local frame = Instance.new("Frame")
frame.Name = "DraggableFrame"
frame.Size = frameSize
frame.Position = framePosition
frame.BackgroundColor3 = frameColor
frame.BorderSizePixel = 0
frame.ZIndex = 0 
frame.Selectable = true 
frame.Active = true 
frame.Draggable = true

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0.2, 0) 
frameCorner.Parent = frame

local buttonSize = UDim2.new(0, 45, 0, 45)
local button = Instance.new("TextButton")
button.Name = "Button"
button.Size = buttonSize
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Position = UDim2.new(0.5, 0, 0.5, 0)
button.BackgroundTransparency = 1
button.Parent = frame
button.Text = "Open"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.ZIndex = 0
button.Active = true

button.MouseButton1Click:Connect(function()
  VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.RightShift, false, game)
end)

frame.Parent = screenGui
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
